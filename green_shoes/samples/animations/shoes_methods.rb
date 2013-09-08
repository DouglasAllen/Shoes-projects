require 'green_shoes'
require 'metaid'

Shoes.app do
  p self.metaclass.to_s
  #~ puts "modules included: #{Shoes.included_modules}"
  #~ alert "Shoes has these modules included: #{Shoes.included_modules}"  
  #~ puts
  #~ puts "Object::Shoes constants:"
  #~ alert "Shoes has these constants: #{Shoes.constants.sort}"
  #~ p Shoes.constants.sort
  #~ puts
  #~ puts "Object::Shoes ancestor classes: #{Object::Shoes.class.ancestors}"
  #~ alert "Shoes has these ancestors: #{Object::Shoes.class.ancestors}"  
  #~ puts
  #~ puts "Object::Shoes super class:"
  #~ alert "Shoes has this superclass: #{Object::Shoes.class.superclass}"
  #~ p Object::Shoes.class.superclass  
  #~ puts
  #~ puts "Object::Shoes methods:"
  #~ alert "Shoes has just these methods: #{Object::Shoes.methods(false).sort}"
  #~ p Object::Shoes.methods(false).sort
  #~ puts
  #~ puts "Shoes.APPS methods:"
  #~ alert "Shoes.APPS methods: #{Shoes.APPS.methods(false).sort}"
  #~ p Shoes.APPS.methods(false).sort  
  #~ puts
  #~ puts "Shoes.app methods: #{self.methods(false).sort}"
  #~ alert "Shoes.app methods: #{self.methods(false).sort}"  
  puts
  #~ puts  "Shoes::Anim ancestors:"
  #~ p Shoes::Anim.class.ancestors
  #~ puts
  #~ puts "Shoes::Anim methods:"
  #~ p Shoes::Anim.methods(false).sort
  #~ puts
  #~ puts "Shoes::App methods:"
  #~ Shoes::App.methods.sort.each {|i| puts i}
  #~ puts "Shoes::Background methods:"
  #~ Shoes::Background.methods.sort.each {|i| puts i}
  #~ Shoes.instance_eval("class << self;self;end")

  #~ stack do
    #~ para "Shoes::VERSION = #{Shoes::VERSION}"
    #~ para "Shoes::DIR = #{Shoes::DIR}"
    #~ para "Shoes::TMP_PNG_FILE = #{Shoes::TMP_PNG_FILE}"
    #~ para "Shoes::HAND = #{Shoes::HAND}"
  #~ end
  
end