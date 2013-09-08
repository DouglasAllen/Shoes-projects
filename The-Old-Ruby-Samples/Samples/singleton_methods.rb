class Klass  
  #~ def Klass.classMethod  
  #~ end
  def self.classMethod  
  end  
end 

k = Klass.new  
def k.sm()  
end

p Klass.singleton_methods 
p k.singleton_methods  

name = "my_name"
def name.name_method
	"#{self} Plus"
end
p name.singleton_methods
p name.name_method

class Klass_subclass < Klass
end
p Klass_subclass.singleton_methods

require 'equation_of_time'
eot = Equation_of_Time.new
p eot.singleton_methods
p Equation_of_Time.singleton_methods