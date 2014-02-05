#
# Shoes Clock by Thomas Bell
# posted to the Shoes mailing list on 04 Dec 2007
#
require 'bigdecimal'
require 'date'
# require 'green_shoes'

def bd(var)
  BigDecimal(var.to_s)
end

def truncate(x)
  bd(360.0 * ( x / 360.0 - Integer( x / 360.0)))
end
  
def mla(ajd_plus)
  t = bd((ajd_plus - 2451545.0) / 36525.0)
  d = bd(t * 36525.0)
  bd(truncate(280.46061666 + 
         d * 360.98564736629 + 
          t * (t * 0.000387933 - 
              t * (t / 38710000.0))))
end

def gmst(t)
  @year = t.year
  @month = t.month
  @day = t.day      
  @date = Date.parse("#{@year}-#{@month}-#{@day}")
  @ajd = @date.ajd * 1.0
  @hour = t.hour
  @min = t.min
  @sec = t.sec
  @total = @hour / 24.0 + @min / 1440.0 + @sec / 86400.0
  @ajdnow = @ajd + @total  
  @sidereal_time = ( mla(@ajdnow) - 88.743 ) / 15.0
end 

def time_now
  t = Time.now.utc
  gmst(t)
  @hours = Integer(@sidereal_time)
  @mins = Integer((@sidereal_time - @hours) * 60.0)
  @secs = Integer(((@sidereal_time - @hours) - @mins / 60.0) * 3600.0)                     
  @time = Time.utc(@year, @month, @day, @hours, @mins, @secs)
end 
  
Shoes.app :height => 760, :width => 1024, :title => "        Greenwich Mean Sidereal Time" do
   
  @centerx, @centery = width / 2, height / 2
  @radius = @centerx / @centery * @centerx
   hour, min, sec = [], [], []

  def draw_background
    
    #~ background black     
    fill black
    stroke black
    strokewidth 4
    oval @centerx - @radius / 2, @centery - @radius / 2, @radius, @radius
	  
    for i in 0..119    
      stroke green      
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

  def clock_hand(time, sw, color, unit=30)
    radius_local = unit == 30 ? @radius / 2 - 8 : @radius / 2 - 55
    _x = radius_local * Math.sin( time * Math::PI / unit )
    _y = radius_local * Math.cos( time * Math::PI / unit )
    stroke color
    strokewidth sw
    line(@centerx, @centery, @centerx + _x, @centery - _y, hidden: true)
  end

  #~ def clock_hands
    #~ clock_hand @time.hour + (@time.min / 60.0),8,12,green
    #~ clock_hand @time.min + (@time.sec / 60.0),5,30,green      
    #~ clock_hand @time.sec,2,30,red        
    #~ clock_hand @time.sec + (@time.usec * 0.000001),2,30,red
  #~ end 

  stack do
    #~ background black
    @msg = para '', margin: 4, align: 'center'#, stroke: white
    draw_background
  end
  
  
  24.times{| i | 5.times{| j | hour << clock_hand( i + ( j / 5.0 ), 8, gold, 12 )}}
  60.times{| i | 4.times{| j | min << clock_hand( i + ( j / 4.0 ), 5, gold )}}
  60.times{| i | 8.times{| j | sec << clock_hand( i + ( j / 8.0 ), 2, red )}}

  animate(8, false) do |i|
    time_now
    t = @time
    h, m, s = t.hour, t.min, t.sec
    t = h * 5 + m / 24.0
    hour[(t-1)%60].hide
    hour[t%60].show
    t = m * 4.0 + s / 15.0
    min[(t-1)%240].hide
    min[t%240].show 
    t = s * 8
    sec.each(&:hide)
    sec[t%480].show 
 
    @msg.text = strong("LMST   " + @time.strftime("%H:%M:%S"))               
    
  end  

end