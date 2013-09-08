# read_data1.rb

File.open("data1.txt").each { |line| puts line }

File.open("data1.txt").each(',') { |line| puts line }

puts $/
p $/
$/ = "\n"
puts $/
p $/
data = []
File.open("data1.txt").each_byte { |byte| data << byte }
p data
data = []
File.open("data1.txt").each_char { |byte|  data << byte }
p data

lines = File.open("data1.txt").lines
puts lines
File.open("data1.txt") do |f|
  2.times { puts f.gets }
end
