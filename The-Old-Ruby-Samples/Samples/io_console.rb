require 'io/console'
File.open $stdin
rows, columns = $stdin.winsize
puts "You screen is #{columns} wide and #{rows} tall"