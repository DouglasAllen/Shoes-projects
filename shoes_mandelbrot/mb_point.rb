def point(x,y,color, size=1)
 stroke color
 (0..size).each do |i|
  line x,y,x+size,y+i
 end 
end

Shoes.app  :height => 150, :width => 200, :title => " " do

 @centery, @centerx = height / 2 - 30, width / 2 
 @aspect = height / width
 background white
 
 def mandelbrot(a)
  Array.new(50).inject(0) { |z,c| z*z + a }
 end
  
 (-1.5).step(1.5, 0.03) do |y|
  (-2.0).step(2.0, 0.03) do |x|
    x0 , y0 = 0, 0
    iteration = 0
    maxIteration = 100
 
    while (x0 * x0 + y0 * y0 <= (2.0 * 2.0) && iteration < maxIteration)
      xtemp = x0 * x0 - y0 * y0 + x
      y0 = 2.0 * x0 * y0 + y 
      x0 = xtemp 
      iteration = iteration + 1     
      if iteration != maxIteration
        c = iteration
      else
        c = 0
      end
      point((x * @centerx).to_i + @centerx, (y * @centery).to_i + @centery, black)    
    end
  end  
 end
end

