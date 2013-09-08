puts "#{$:}"
#~ libdir = File.dirname(__FILE__)
#~ $LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)
#~ # Or if I care about having the full path...

#~ libdir = File.expand_path(File.dirname(__FILE__))
#~ $LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)
#~ $:.unshift(File.expand_path(File.dirname(__FILE__)))
puts "Current directory for File.dirname(__FILE__) = #{File.dirname(__FILE__)}"
puts "is $LOAD_PATH including the current direcrory? #{$:.include?(File.dirname(__FILE__))}"
puts "Current directory for File.expand_path(File.dirname(__FILE__)) = #{File.expand_path(File.dirname(__FILE__))}"
puts "is $LOAD_PATH including the current direcrory? #{$:.include?(File.expand_path(File.dirname(__FILE__)))}"

# As of late I've been doing the following:
#~ libdir = File.expand_path(File.dirname(__FILE__))
#~ $:.unshift(File.expand_path(File.dirname(__FILE__))) unless
    #~ $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))



#~ puts $:.include?(File.dirname(__FILE__))
#~ puts $:.unshift(File.expand_path(libdir))
puts $LOAD_PATH.unshift(File.dirname(__FILE__))
require File.expand_path(File.join(File.dirname(__FILE__), 'dir'))