#
# Shoes Clock by Thomas Bell
# posted to the Shoes mailing list on 04 Dec 2007
# Original code for Red Shoes is: https://github.com/shoes/shoes/blob/master/samples/good-clock.rb
# The following is a little bit modified snippet for Green Shoes, using show and hide instead of clear.
#
require 'green_shoes'

Shoes.app :width => 800,
          :height => 600,
          :title => 'Shoes 24 Hour Analog Clock',
          :resize => true do          
  
  background rgb(230, 240, 200)
  hour, min, sec = [], [], []
  @centerx, @centery = width / 2, height / 2
  @radius = @centerx / @centery * @centerx  

  stack do
    background black
    @msg = para '', :margin => 4, :align => 'center'
  end
  
  animate 1 do |i|
    t = Time.now
    h, m, s, u = t.hour, t.min, t.sec, t.usec
    
#    if i % 8 == 0
#      @msg.text = fg(t.strftime("%a"), tr_color("#ccc")) +
#        fg(t.strftime(" %b %d, %Y "), tr_color("#ccc")) +
#        strong(fg(t.strftime("%I:%M"), white)) +
#        fg(t.strftime(":%S"), tr_color("#ccc"))
#    end

#    t = h * 5 + m / 12; hour[(t - 1) % 60].hide; hour[t % 60].show
    t = h * 5 + m / 12; hour[(t - 1) % 60].hide; hour[t % 60].show
#    t = m * 4 + s / 15; min[(t - 1) % 240].hide; min[t % 240].show 
#    t = s * 8 + u / 125000; sec.each(&:hide); sec[t % 480].show  
  end
          
  def draw_background    
    
    fill white
    stroke black
    strokewidth 4
    oval @centerx - @radius / 2, @centery - @radius / 2, @radius, @radius

    fill black
    nostroke
    oval @centerx - 5, @centery - 5, 10, 10

    stroke black    
    for i in 0..119
      x = (@radius / 2) * Math.sin(i * Math::PI / 12)
      y = (@radius / 2) * Math.cos(i * Math::PI / 12)
      strokewidth 2
      line(@centerx + x, @centery + y, @centerx + x / 1.3, @centery + y / 1.3)
      x_m = (@radius / 2) * Math.sin(i * Math::PI / 30) 
      y_m = (@radius / 2) * Math.cos(i * Math::PI / 30)
      strokewidth 6
      line(@centerx + x_m, @centery + y_m, @centerx + x_m / 1.1, @centery + y_m / 1.1)

    end
  end  
  
  draw_background
  
  def clock_hand(time, sw, unit = 30, color = black)
    radius_local = unit == 30 ? @radius / 2 - 8 : @radius / 2 - 55
    _x = radius_local * Math.sin( time * Math::PI / unit )
    _y = radius_local * Math.cos( time * Math::PI / unit )
    stroke color
    strokewidth sw
    line @centerx, @centery, @centerx + _x, @centery - _y, :hidden => true
  end  
  
  12.times{|i| 5.times{|j| hour << clock_hand(i + (j / 5.0), 8, 6)}}
  60.times{|i| 4.times{|j| min << clock_hand(i + (j / 4.0), 5)}}
  60.times{|i| 8.times{|j| sec << clock_hand(i + (j / 8.0), 2, 30, red)}}  
    
end
