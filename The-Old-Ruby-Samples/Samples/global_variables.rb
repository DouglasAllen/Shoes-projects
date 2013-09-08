# scopevars.rb
puts $_  # new line

puts $0  # this file
puts $:  # library search paths
puts $LOAD_PATH  # library search paths
puts $:.unshift()
puts $LOAD_PATH.unshift()

puts $$
#puts $-K
puts $&
puts $`
puts $'
puts $+
puts $.
puts $:.methods

