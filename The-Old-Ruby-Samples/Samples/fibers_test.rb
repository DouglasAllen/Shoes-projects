sg = Fiber.new do
  s = 0
  loop do
    square = s * s
    Fiber.yield square
    s += 1
  end
end

puts sg
#~ puts sg.methods
#~ 10.times { puts sg.methods}
#~ puts sg.display