#!/usr/bin/env ruby

$:.unshift(".") #patch for 1.9.2

# Load Rake
begin
  require 'rake'
rescue LoadError
  require 'rubygems'
  require 'rake'
end

def download(args)
  args = URI.parse(args) if args.is_a?(String)
  
  options = {
    :progress => true,
    :verbose => Rake.application.options.trace
  }
  
  # Given only a download URL, download into a temporary file.
  # You can infer the file from task name.
  if URI === args
    temp = Tempfile.open(File.basename(args.to_s))
    file_create(temp.path) do |task|
      # Since temporary file exists, force a download.
      class << task ; def needed?() ; true ; end ; end
      task.sources << args
      task.enhance { args.download(temp, options) }
    end
  else
    # Download to a file task instead
    fail unless args.keys.size == 1
    target = args.keys.first.to_s
    uri = URI.parse(args.values.first.to_s)
    file_create(target) do |task|
      task.sources << uri
      task.enhance { uri.download(task.name, options) }
    end
  end
end

# Added download task from buildr
#~ require 'rake/downloadtask'
#~ require 'rake/extracttask'

# RubyInstaller configuration data
#~ require 'config/ruby_installer'

#~ Dir.glob("#{RubyInstaller::ROOT}/recipes/**/*.rake").sort.each do |ext|
  #~ puts "Loading #{File.basename(ext)}" if Rake.application.options.trace
  #~ load ext
#~ end
