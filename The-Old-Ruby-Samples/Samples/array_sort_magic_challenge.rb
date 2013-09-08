require 'profile'

# find a simple solution to sorting the array and placing the zeros last
a = [23, 4, 8, 4, 0, 2, 0, 17]

#~ p a.sort
#~ p a.sort.partition{|x| x != 0}
#~ p a.sort.partition{|x| x != 0}.flatten
#~ puts

#~ p a.sort_by {|x| x.zero? ? a.max + 1 : x }
#~ puts

#~ def compare(x, y)
  #~ if x > y
    #~ y.zero? ? -1 : 1
  #~ elsif y > x
    #~ x.zero? ? 1 : -1
  #~ else
    #~ 0
  #~ end
#~ end
 
#~ p a.sort { |x, y| compare(x, y) } 
#~ puts

#~ b = a.sort
#~ c = a.grep(0)
#~ b.delete(0)
#~ p b.concat(c)
#~ puts

p a.group_by { |e| e }
p a.group_by { |e| e }.class
p a.group_by { |e| e }.map
p a.group_by { |e| e }.map.class
p a.group_by { |e| e }.map(&:last)
p a.group_by { |e| e }.map(&:last).class
p a.group_by { |e| e }.map(&:last).sort
p a.group_by { |e| e }.map(&:last).sort.class
a = a.group_by { |e| e }.map(&:last).sort
a << a.shift
p a
p a.flatten
puts
