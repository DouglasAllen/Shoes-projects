=begin

Proc objects are blocks of code that have been bound to a set of local variables.
Once bound, the code may be called in different contexts and still access those variables

=end

def get_a_multiplier(factor)
    return Proc.new {|n| n*factor }
end

times3 = get_a_multiplier(3)
times5 = get_a_multiplier(5)
puts
puts "times3 = get_a_multiplier(3) so times3.call(12) = #{times3.call(12)}"      #=> 36
puts "times5 = get_a_multiplier(5) so times5.call(5) = #{times5.call(5)}"         #=> 25
puts "and so times3.call(times5.call(4)) = #{times3.call(times5.call(4))}"           #=> 60
puts

def my_if cond
  yield if cond
end

a = 5
puts "a = #{a}"
# prints "a is less than 10"
# returns 6
my_if(a < 10) {
  puts "a is less than 10"
  a += 1
}

puts "a = #{a}"
puts 

my_lambda = lambda {|x, y| puts x + y}
my_proc = Proc.new {|x, y| puts x + y}

# works as expected, prints 6, ignores extra argument.
my_proc.call(1, 5, 11)

# an ArgumentError exception is thrown because of the extra argument and lambdas check for arity
# my_lambda.call(1, 5, 11)
puts

def return_from_a_proc
    ret = Proc.new { return "Here I go from a proc" }
    ret.call
    "This is not reached"
end

# prints "Here I go from a proc"
puts return_from_a_proc
puts

def return_from_a_lambda
    ret = lambda { return "Here I go from a lambda" }
    ret.call
    "This is printed"
end

# prints "This is printed"
puts return_from_a_lambda
puts

myarray = [1,2,3,4,5]

myarray.each { |item|
  puts item
}

# produces:
# 1
# 2
# 3
# 4
# 5
puts

def method
  val = yield 0
  puts "value of yield0 : #{val}"
  val = yield 1
  puts "value of yield1 : #{val}"
end

method {|i| "return_val#{i}"}

# produces:
# value of yield0 : return_val0
# value of yield1 : return_val1
puts

myarray = [1,2,3,4,5]

puts myarray.find_all { |array_item| array_item > 3 }    # [4, 5]
puts myarray.map { |array_item| array_item * 2 }         # [2, 4, 6, 8, 10]

### and something more hardcore:

class Array
  def sum
    inject { |sum,x| sum+x }
  end

  def mean
    sum / size
  end
end

puts myarray.sum  # 15
puts myarray.mean # 3