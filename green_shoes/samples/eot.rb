require 'green_shoes'
require 'equation_of_time'

eot = Equation_of_Time.new()
Shoes.app :width => 400, :height => 400 do
  #background black
  
  stack do

  	# Time.now is a Synonym for Time.new()  	
  	message1 = "Equation of Time = "
    delta_t = eot.equation_of_time
    message2 = eot.display_equation_of_time(delta_t)
    message3 = " at noon today."
    para "Time now is #{Time.new().utc}" 
    para message1 + message2 + message3
    para "Your Noon is your longitude / 15.0"
	 para "or what is know as your Local Hour."
	 para "Local Hour Angle is the same as your Longitude"
	 para "But the Sun is not exactly overhead every day at this time."
	 para "So the Equation of Time corrects for this."
    para "Your Noon - " + message2 + " = actual Noon or the time the Sun is at your Hour Angle."
    para "Check it using a stake, compass, and watch." 
    para "Observe the shadow of the stake at true north or true south."
    para "A second stake is helpful to mark north or south alignment."
    para "Then it's just a matter of time. Try to be early."
  end  
end