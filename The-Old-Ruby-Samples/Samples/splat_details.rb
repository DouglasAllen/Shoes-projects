=begin  splat_details.rb
I see this all the time especialy in ruby-docs but everyone treats it 
like it is so trivial. We use it all the time without realizing it, at
least I do. Here it is taken from http://rubylearning.com/satishtalim/numbers_in_ruby.html
But this certain topic is more about using and operator which I lost 
focus on anyway. Later that day I wanted to know more about using 
"splat" or this asteric thingy besides multiply.
=end

def g *args # The splat here says accept 1 or more arguments, in the form of an Array  
  args      # This returns an array  
end 

a = '.methods'
b = '.sort'
c = '.each'
d = g(a,b,c)
p d # does show me the array. 
=begin
       Now what may I do with it?
       May I call these methods from this array?
       Or is this not quite set up right?
       Will we get into this later in the lessons?
=end 

def foo(*my_string)  
  my_string.inspect  
end  
puts foo('hello','world')  
puts foo()  

#  The Strange Ruby Splat

#   Method Definitions
# You can use a splat in a method definition to gather up any 
# remaining arguments:

def say(what, *people)
  people.each{|person| puts "#{what} #{person}"}
end 

say "Hello!", "Alice", "Bob", "Carl"

def arguments_and_opts(*args, opts)
  puts "arguments: #{args} options: #{opts}"
end

arguments_and_opts 1,2,3, :a=>5

def print_pair(a,b,*)
  puts "#{a} and #{b}"
end

print_pair 1,2,3,:cake,7

#  Calling Methods
people = ["Rudy", "Sarah", "Thomas"]

say "Howdy!", *people

def add(a,b)
  a + b
end

pair = [3,7]
add *pair

#  Array Destructuring

a,b = 1,2               # Assign 2 values at once

a,b = b,a               # Assign values in parallel

puts "#{a} and #{b}"


first, *list = [1,2,3,4]          # first= 1, list= [2,3,4]
p first
p *list
*list, last  = [1,2,3,4]          # list= [1,2,3], last= 4
p last
p *list
first, *center, last = [1,2,3,4]  # first= 1, center= [2,3], last=4
p first
p *center
p last 

# Unquote a String (don't do this)

#_, *unquoted, _ = '"quoted"'.split(//)

#puts unquoted.join

# quoted

#  Array Coercion

a = *"Hello"  #=> ["Hello"]
p a

a = "Hello"
# "Hello".to_a  #=> NoMethodError: undefined method `to_a' for "Hello":String
# p a.to_a      #=> same as above error.


a = *(1..3)   #=> [1, 2, 3]
p a
a = *[1,2,3]  #=> [1, 2, 3]
p a

j = *[] #=> nil in 1.8 but [] in 1.9
p j

proc { |x, *| puts x }.call(1, 2)


ptr = *[]
p ptr.class







