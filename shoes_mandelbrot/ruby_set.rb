require 'complex'
 
def mandelbrot(a)
  Array.new(5).inject(0) { |z,c| z*z + a }
end
 
(1.0).step(-1,-0.05) do |y|
  (-2.0).step(0.5,0.0315) do |x|
    #~ print mandelbrot(Complex(x,y)).abs < 2 ? '*' : ' '
    puts "#{x}, #{y} #{mandelbrot(Complex(x,y)).abs}"
  end
  #~ puts
end


#~ p mandelbrot(Complex(10, 10)).abs