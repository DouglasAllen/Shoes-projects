#~ ruby_env = Array.new
#~ system 'ruby -e "puts $:"'
$: << ENV['GEM_HOME']
$: << 'lib'
require 'shoes'
require 'shoes/configuration'
require 'swt'
require 'jruby-jars'
require 'java'

def show(*args)
  args.flatten.sort#.sort.each {|m| puts m.to_s}
end
  
#~ puts show(Shoes.constants)
#~ puts
#~ Shoes.public_methods(false).each {|m| puts show(m)}

#~ puts
#~ Shoes::App.public_instance_methods(false).sort.each {|m| puts show(m)}
#~ Shoes.constants.sort.each {|morc| puts morc}
#~ p Shoes.methods.sort
#~ java_import 'org.eclipse.swt.graphics.Pattern'
#~ Shoes.configuration.backend = :swt
#~ Shoes.app do
#~ end
#~ require 'samples\simple-sound.rb'
#~ temp = ["C:/jruby-1.7.4/lib/ruby/1.9/site_ruby", "C:/jruby-1.7.4/lib/ruby/shared", "C:/jruby-1.7.4/lib/ruby/1.9"]
s = Shoes::App.new