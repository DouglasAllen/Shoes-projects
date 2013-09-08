# http://talklikeaduck.denhaven2.com/2007/06/02/chain-chain-chain
a = "abc"
b = "def"

def a.method# singleton class for the object referenced by a is created now
	reverse
end 

puts a.method

class << b #singleton class for the object referenced  by b is created now
  def self.reverse
	  reverse
  end
end
 
puts b
puts b.reverse
 
class MyClass
	
  def initialize # This defines the initialize method in MyClass which
                     # Like all such methods are available to INSTANCEs
                     # of the class, and its subclasses
  end

  def method1 # another instance method
  end

  def MyClass.class_method # This defines a class method in the
                                        # singleton class of MyClass (i.e. the metaclass)
                                        # which is available to instances of the
                                        # metaclass and its subclasses
  end

  def self.class_method_2 # This adds another class method, it's
                                    # Just a different syntax for the last form of
                                    # definition since within the scpe of a class
                                    # definition, self is bound to that class
  end

  class << self   # or equivalently class << MyClass
                        # Now we are in an inner scope, that of MyClass' metaclass

     def class_method_3  # So this also becomes a class method
                                     # of MyClass
	  end
  end
								
end
							
puts MyClass.instance_methods(false)
#~ puts MyClass.instance_methods(true)	