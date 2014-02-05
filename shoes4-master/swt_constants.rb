$: << ENV['GEM_HOME']
$: << 'lib'
require 'shoes'


require 'shoes/configuration'
Shoes.configuration.backend = :swt

def show(*args)
  p args.flatten.sort #+ "\n"#.sort.each {|m| puts m.to_s}
end

show Swt::SWT.constants

