def point(x,y,color, size=1)
 stroke color
 (0..size).each do |i|
  line x,y,x+size,y+i
 end 
end
#~ stroke bg_color
 #~ line x,y+1,x+1,y+1
# height, width  = 760.0, 1024.0
Shoes.app  :height => 768, :width => 1024, :title => "     Roseland Revisited" do

  background white
  @centery, @centerx = height / 2 - 30, width / 2
  @radius = @centerx / @centery * @centerx
  ar = width / height

  g = 396

  
  (0..360).step(0.01) do |i|
    a = i * Math::PI / 180.0
    h = g * Math::PI / 180.0
    r = 352 * Math.sin(g * a)
    x = (r * Math.cos(a)) + @centerx
    y = (r * Math.sin(a)) * ar + @centery
    point x.to_i.abs, y.to_i.abs, lime, 3   
    # puts "y = #{y.to_i.abs}, x = #{x.to_i.abs}"
  end


 # r > 256 ? c = (r.to_i.abs + 1) : c = 256
    # c = c * 1024    
    # point x.to_i, y.to_i, lawngreen, 3#"#a" + c.to_s(16)
    #~ puts "#{x.to_i}, #{y.to_i}" 
end

