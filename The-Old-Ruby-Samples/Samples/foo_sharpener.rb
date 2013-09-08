# http://www.igvita.com/2007/05/08/5-ways-to-sharpen-your-ruby-foo/
# foo_sharpener.rb
=begin

Working with collections

Sorting is always on the agenda and Ruby allows a couple of interesting constructs to simplify the process.
For example, if you want to sort an array with respect to some arbitrarily defined order (i.e. another array of values),
you can use the following snippet:
=end

# sort by preferred order, return 0 -> aka, equal to if item is not specified
preferred_order = %w{flute oboe violin}
p preferred_order
p %w{oboe violin flute}.sort_by{|i| preferred_order.index(i) || 0 }


# modifying the above idiom, we can easily randomize a collection
p [1,2,3,4,5].sort_by { rand }

=begin
Hashes also have a number of interesting options.
For example, instead of returning nil when a key does not exist,
we can either return a default value,
or even automatically create and initialize the entry:
=end

# Set default to 0 (instead of nil)
hash = Hash.new(0)
p hash
#p hash.has_key? 'no_such_key' => false

p hash['no_such_key'] # => 0
p hash.has_key? 'no_such_key' # => false

# Instead of simply returning a default, we can automatically initialize the value
hash = Hash.new {|hash, key| hash[key] = 0}
# hash.has_key? 'no_such_key' => false
# hash['no_such_key'] => 0
# hash.has_key? 'no_such_key' => true

=begin
Method search order

On every method call, Ruby will search its object space in the following order: 1. Current instance, followed by class methods 2. Mixed in methods 3. Superclass instance (repeat 1) 4. Object methods, followed by Kernel mixin

I often get confused with mixin, class, and instance method precedence, so this is a useful model to revisit and keep in mind.

Comparing objects

Perusing through the conditional constructs section of the book, I found an interesting distinction between object comparisons inside the case statement, versus the 'normal' scenario:

# Comparing objects inside a 'case' statement
 def ===(other_object); self.value == other_object.value; end

# Comparing objects
 def <=>(other_object); self.value <=> other_object.value; end
Case statement uses the three-equals method (string comparison) when it examines an object; a nice gotcha if you ever tried switching on a non to_s friendly construct. As such, this means that if you want your custom object to behave properly when compared on a specific value, you need to define both methods, not just the spaceship operator (<=>).

Lambda vs Proc

The line between lambda and proc constructs is blurry to say the least, but here is one gotcha that you definitely have to be aware of: calling return inside a proc is different from calling it in lamba!

def return_test
 l = lambda { return }
 l.call # will continue
 p "Still here!"
 
 p = Proc.new { return }
 p.call # exits here
 puts "You won't see this message!"
end
Useful one-liners

Finally, no list of Ruby-foo techniques would be complete without a selection of Ruby one-liners, which by the very nature of Ruby often accomplish more than a dozen of lines in other languages. So here are a few useful snippets to add to your repertoire:

# List instance methods without ancestor methods
String.instance_methods(false)

# List all local variables
local_variables # => ["_"]
a = "test"
local_variables # => ["_","a"]

# Converting to different base with to_i
"2".to_i(2) => 0    # convert 2 to base 2

# Convert a string like "1-10" to a range object (1..10)
class String; def to_range; Range.new(*self.split("-").map{|i|i.to_i}); end; end
=end
