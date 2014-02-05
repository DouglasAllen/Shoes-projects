height, width  = 760.0, 1024.0
@centery, @centerx = height / 2 - 30, width / 2
@radius = @centerx / @centery * @centerx

ar = width / height

g = 444

include Math
(1..360).step(1.0) do |i|
  p a = i * PI / 180.0
  #~ h = g * PI / 180.0
  #~ r = 352 * sin(h * a)
  #~ x = (r * cos(a)) + @centerx
  #~ y = (r * sin(a)) * ar + @centery
  #~ point x.to_i.abs, y.to_i.abs, hotpink, 3   
  #~ puts "y = #{y.to_i.abs}, x = #{x.to_i.abs}"
  #~ puts i
end