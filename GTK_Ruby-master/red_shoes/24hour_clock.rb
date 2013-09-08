#
# Shoes Clock by Thomas Bell
# posted to the Shoes mailing list on 04 Dec 2007
# Original code for Red Shoes is: https://github.com/shoes/shoes/blob/master/samples/good-clock.rb
# This is modified to be size adjustable via the width and height attributes.
# Also more points of time indication (hours, minutes and seconds) as an analog clock would appear to have.
# An attempt was started to improve understanding of the digital diplay. Later maybe. This is an analog clock.
#



Shoes.app width: 800,
          height: 600,
          title: '24 Hour Analog Clock',
          resize: true do          
  

  @centerx, @centery = width / 2, height / 2
  @radius = @centerx / @centery * @centerx
    
animate(1) do
    
    @time = Time.now.utc
#    @time = Time.now     
    
    clear do
    
      draw_background
      
      clock_hands
                
    end
    
  end
          
  def draw_background    
     
    background rgb(230, 240, 200)
    
    fill white
    stroke black
    strokewidth 4
    oval @centerx - @radius / 2, @centery - @radius / 2, @radius, @radius

    fill black
    nostroke
    oval @centerx - 5, @centery - 5, 10, 10
        
    for i in 0..119
    
      stroke black
      
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
  
  def clock_hands    
#    clock_hand @time.sec + (@time.usec * 0.000001),2,30,red
    clock_hand @time.sec,2,30,red
    clock_hand @time.min + (@time.sec / 60.0),5
    clock_hand @time.hour + (@time.min / 60.0),8,12     
  end
  
  def clock_hand(time, sw, unit=30, color=black)
    radius_local = unit == 30 ? @radius / 2 - 8 : @radius / 2 - 55
    _x = radius_local * Math.sin( time * Math::PI / unit )
    _y = radius_local * Math.cos( time * Math::PI / unit )
    stroke color
    strokewidth sw
    line(@centerx, @centery, @centerx + _x, @centery - _y)
  end  
      
end
