Shoes.setup do
	gem 'RubySunrise'
  gem 'tzinfo'
end
 
require 'solareventcalculator'
 
Shoes.app do	
		
	stack do
		
	  para "Date: example dd-mm-yyyy"
          date = edit_line	  
	  
# negative for western degrees longitude, no sign for eastern longitude.
	  para "Your Longitude?: example -90.1234" 
	  long = edit_line
	  
	  para "Your Latitude?: example 40.1234"
	  lat = edit_line
	            
	  para "Calculate Times"
	  @b1 = button "Calculate"  
	  @b1.click do
# you still need a time zone for calc with tzinfo else use utc method. See the gem
             tzinfo = 'America/Chicago' # general format for tzinfo
	     p1 = Date.parse(date.text) # parameter one and so on.
	     p2 = BigDecimal.new(lat.text)
	     p3 = BigDecimal.new(long.text)
	     my_sec = SolarEventCalculator.new(p1, p2, p3)
	     sunrise = my_sec.compute_official_sunrise(tzinfo).to_s
	     sunset = my_sec.compute_official_sunset(tzinfo).to_s
	     stack do
	       para sunrise.split('T').join('  ')
	       para sunset.split('T').join('  ')
             end			 
	  end	  	
	end		
end