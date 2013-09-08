#require 'profile'

#a = nil
b = 20
#a ||= b
#puts a.inspect        # => 20

h = {}

def h.[]=(k, v)
  #puts "Setting hash key #{k} with #{v.inspect}"
  super
end

# 1. The standard ||= approach

h[:x] = 5
h[:x] ||= 10
h[:x] ||= 20

h[:x] = nil
h[:x] ||= 10
h[:x] ||= 20

h[:x] = nil
h[:x] ||= 20
h[:x] ||= 10
# 2. The a = a || b approach
#h[:y] = h[:y] || 10
#h[:y] = h[:y] || 20

# 3. The a || a = b approach
#h[:z] || h[:z] = 10
#h[:z] || h[:z] = 20

class MyClass
  attr_reader :val

  def val=(value)
    puts "Setting value to #{value.inspect}"
    @val = value
  end
end

# 1. The standard ||= approach
obj = MyClass.new
obj.val ||= 'a'
obj.val ||= 'b'

# 2. The a = a || b approach
obj = MyClass.new
obj.val = obj.val || 'c'
obj.val = obj.val || 'd'

# 3. The a || a = b approach
obj = MyClass.new
obj.val || obj.val = 'e'
obj.val || obj.val = 'f'

hsh = Hash.new('default')

hsh[:x]         # => 'default'

# 1. The standard ||= approach
hsh[:x] ||= 10
p hsh           # => {}

# 2. The a = a || b approach
hsh[:y] = hsh[:y] || 10
p hsh           # {:y=>"default"}

# 3. The a || a = b approach
hsh[:z] || hsh[:z] = 10
p hsh           # {:y=>"default"}

#a || a = 42
a ||= 42

#x = 10 if 2 == 5
#puts x

x = x
puts x