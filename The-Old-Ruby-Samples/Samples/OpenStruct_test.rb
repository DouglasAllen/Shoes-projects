=begin

OpenStruct
In Files
lib/ostruct.rb 
Parent
Object

An OpenStruct is a data structure, similar to a Hash, that allows the definition of 
arbitrary attributes with their accompanying values. 
This is accomplished by using Ruby’s metaprogramming to define methods on the class 
itself. 

Examples:
=end
  require 'ostruct'

  person = OpenStruct.new
  person.name    = "John Smith"
  puts person.name  
  
  person = OpenStruct.new(:name => "Sahra Jane Smith")
  puts person.name  
  person.age     = 70
  person.pension = 300  
  puts person.address  # -> nil
  
# An OpenStruct employs a Hash internally to store the methods and values and can even be initialized with one: 

  australia = OpenStruct.new(:country => "Australia", :population => 20_000_000)
  puts australia   # -> <OpenStruct country="Australia" population=20000000>
  
=begin
Hash keys with spaces or characters that would normally not be useable for method 
calls (e.g. ()[]*) will not be immediately available on the OpenStruct object as a 
method for retrieval or assignment, but can still be reached through the Object#send 
method. 
=end

  measurements = OpenStruct.new("length (in inches)" => 24)
  p measurements.send("length (in inches)")  # -> 24

  data_point = OpenStruct.new(:queued? => true)
  p data_point.queued?                       # -> true
  data_point.send("queued?=",false)
  p data_point.queued?                       # -> false
  
=begin
Removing the presence of a method requires the execution of a delete_field method 
as setting the property value to nil will not remove the method.
=end

  first_pet = OpenStruct.new(:name => 'Rowdy', :owner => 'John Smith')
  p first_pet.owner 
  first_pet.owner = nil
  second_pet = OpenStruct.new(:name => 'Rowdy')

  p first_pet == second_pet   # -> false

  first_pet.delete_field(:owner)
  p first_pet == second_pet   # -> true
  
=begin
Implementation:
An OpenStruct utilizes Ruby’s method lookup structure to find and define the necessary 
methods for properties. This is accomplished through method_missing and define_method. 

This should be a consideration if there is a concern about the performance of the objects
that are created, as there is much more overhead in the setting of these properties 
compared to using a Hash or a Struct. 

Public Class Methods
new(hash=nil) click to toggle source 
Creates a new OpenStruct object. By default, the resulting OpenStruct object will have 
no attributes. 

The optional hash, if given, will generate attributes and values. For example: 
=end
  #require 'ostruct'
  hash = { "country" => "Australia", :population => 20_000_000 }
  data = OpenStruct.new(hash)

  puts data        # -> <OpenStruct country="Australia" population=20000000>

=begin
# File lib/ostruct.rb, line 86
86:   def initialize(hash=nil)
87:     @table = {}
88:     if hash
89:       for k,v in hash
90:         @table[k.to_sym] = v
91:         new_ostruct_member(k)
92:       end
93:     end
94:   end
Public Instance Methods
==(other) click to toggle source 
Compares this object and other for equality. 
An OpenStruct is equal to other when other is an OpenStruct and the two object’s Hash
tables are equal. 

# File lib/ostruct.rb, line 232
232:   def ==(other)
233:     return false unless(other.kind_of?(OpenStruct))
234:     return @table == other.table
235:   end
delete_field(name) click to toggle source 
Remove the named field from the object.
Returns the value that the field contained if it was defined. 
=end
  #require 'ostruct'

  person = OpenStruct.new('name' => 'John Smith', 'age' => 70)

  puts person.delete_field('name')  # => 'John Smith'
  
=begin
# File lib/ostruct.rb, line 190
190:   def delete_field(name)
191:     sym = name.to_sym
192:     singleton_class.__send__(:remove_method, sym, "#{name}=")
193:     @table.delete sym
194:   end
initialize_copy(orig) click to toggle source 
Duplicate an OpenStruct object members. 

# File lib/ostruct.rb, line 97
 97:   def initialize_copy(orig)
 98:     super
 99:     @table = @table.dup
100:   end
inspect() click to toggle source 
Returns a string containing a detailed summary of the keys and values. 

     # File lib/ostruct.rb, line 201
201:   def inspect
202:     str = "#<#{self.class}"
203: 
204:     ids = (Thread.current[InspectKey] ||= [])
205:     if ids.include?(object_id)
206:       return str << ' ...>'
207:     end
208: 
209:     ids << object_id
210:     begin
211:       first = true
212:       for k,v in @table
213:         str << "," unless first
214:         first = false
215:         str << " #{k}=#{v.inspect}"
216:       end
217:       return str << '>'
218:     ensure
219:       ids.pop
220:     end
221:   end
Also aliased as: to_s 
marshal_dump() click to toggle source 
Provides marshalling support for use by the Marshal library. 
Returning the underlying Hash table that contains the functions defined as the keys
and the values assigned to them. 
=end
   #require 'ostruct'

   #person = OpenStruct.new
   person.name = 'John Smith'
   person.age  = 70

   puts person.marshal_dump # => { :name => 'John Smith', :age => 70 } 
	
=begin
# File lib/ostruct.rb, line 115
115:   def marshal_dump
116:     @table
117:   end
marshal_load(x) click to toggle source 
Provides marshalling support for use by the Marshal library. 
Accepting a Hash of keys and values which will be used to populate the internal table 
=end
   #require 'ostruct'

   event = OpenStruct.new
   hash = { 'time'   => Time.now, 
	             'title'  => 'Birthday Party'
				 }
	 
   event.marshal_load(hash)   
	p Marshal.dump(event)   
   
   puts event.title.class
	
hash = { :time  => Time.now, 
				 :title => 'Birthday Party'
			  }
event.marshal_load(hash)   
p Marshal.dump(event)	
puts event.title
	
=begin
# File lib/ostruct.rb, line 130
130:   def marshal_load(x)
131:     @table = x
132:     @table.each_key{|key| new_ostruct_member(key)}
133:   end
new_ostruct_member(name) click to toggle source 
new_ostruct_member is used internally to defined properties on the OpenStruct. It does this by using the metaprogramming function define_method for both the getter method and the setter method. 

# File lib/ostruct.rb, line 154
154:   def new_ostruct_member(name)
155:     name = name.to_sym
156:     unless self.respond_to?(name)
157:       class << self; self; end.class_eval do
158:         define_method(name) { @table[name] }
159:         define_method("#{name}=") { |x| modifiable[name] = x }
160:       end
161:     end
162:     name
163:   end
to_s() click to toggle source 
Protected Instance Methods
modifiable() click to toggle source 
modifiable is used internally to check if the OpenStruct is able to be modified 
before granting access to the internal Hash table to be modified. 

# File lib/ostruct.rb, line 139
139:   def modifiable
140:     begin
141:       @modifiable = true
142:     rescue
143:       raise TypeError, "can't modify frozen #{self.class}", caller(3)
144:     end
145:     @table
146:   end
Disabled; run with --debug to generate this.

[Validate]

Generated with the Darkfish Rdoc Generator 1.1.6.
=end

event = OpenStruct.new
  hash = { :time => Time.now, :title => 'Birthday Party'}
  event.marshal_load hash
  p event.title
  md = Marshal.dump event
  ret = Marshal.load md
  p ret.title

  
  event = OpenStruct.new
  hash = { 'time' => Time.now, 'title' => 'Birthday Party'}
  event.marshal_load hash
  p event.title
  md = Marshal.dump event
  ret = Marshal.load md
  p ret.title