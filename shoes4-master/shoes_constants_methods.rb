
$: << ENV['GEM_HOME']
$: << 'lib'
require 'shoes'


require 'shoes/configuration'
Shoes.configuration.backend = :swt

def show(*args)
  p args.flatten.sort #+ "\n"#.sort.each {|m| puts m.to_s}
end
#~ name.method_defined?(:public_instance_methods) : name.class
Shoes.constants.sort.each do |name|
  
  if Shoes.const_get(name).class == Class 
    cond = Shoes.const_get(name).public_instance_methods(false).empty?    
    puts "Shoes::#{name} => #{Shoes.const_get(name).public_instance_methods(false)}" unless cond
  end
  if Shoes.const_get(name).class == Module
    cond = Shoes.const_get(name).public_instance_methods(false).empty?
    puts "Shoes::#{name} => #{Shoes.const_get(name).public_instance_methods(false)}" unless cond
  end
end
show Shoes
=begin
info = <<EOS

** Shoes::Animation **
#{show Shoes::Animation.public_instance_methods(false).sort}

** Shoes::App **
#{show Shoes::App.public_instance_methods(false).sort}

** Shoes::Arc **
#{show Shoes::Arc.public_instance_methods(false).sort}

** Shoes::Background **
#{show Shoes::Background.public_instance_methods(false).sort}

** Shoes::Border **
#{show Shoes::Border.public_instance_methods(false).sort}

** Shoes::BuiltinMethods **
#{show Shoes::BuiltinMethods.public_instance_methods(false).sort}

** Shoes::Button **
#{show Shoes::Button.public_instance_methods(false).sort}

** Shoes::COLORS **
#{show Shoes::COLORS.keys}

** Shoes::Check **
#{show Shoes::Check.public_instance_methods(false).sort}

** Shoes::Color **
#{show Shoes::Color.public_instance_methods(false).sort}

** Shoes::Common **
#{show Shoes::Common.public_methods(false).sort}

** Shoes::CommonMethods **
#{show Shoes::CommonMethods.public_instance_methods(false).sort}

** Shoes::Configuration **
#{show Shoes::Configuration.public_methods(false).sort}

** Shoes::CurrentPosition **
#{show Shoes::CurrentPosition.public_instance_methods(false).sort}

** Shoes::DEFAULT_TEXTBLOCK_FONT **
#{show Shoes::DEFAULT_TEXTBLOCK_FONT}

** Shoes::DIR **
#{show Shoes::DIR}

** Shoes::DSL **
#{show Shoes::DSL.public_instance_methods(false).sort}

** Shoes::DeprecatedShoesGemSetup**
#{show Shoes::DeprecatedShoesGemSetup.public_instance_methods(false).sort}

** Shoes::Dialog **
#{show Shoes::Dialog.public_instance_methods(false).sort}
EOS
=end
#~ puts info