# analemma_shoes.rb
Shoes.setup do
  gem 'equation_of_time'
end
require 'equation_of_time'
eot = Equation_of_Time.new()
start = "2013-1-1"
start_date = Date.parse(start).jd
finish = "2013-12-31"
finish_date = Date.parse(finish).jd
data = []
for jd in start_date..finish_date    
      date = Date.jd(jd).to_s
      timejc = eot.time_julian_centurey(jd)    
      equation_of_time = eot.equation_of_time(timejc)    
      degrees_declination = eot.declination(timejc)
      delta_t = eot.display_equation_of_time(equation_of_time)
      declination = eot.display_degrees(degrees_declination)
      
      data << date + "\t\t" +  delta_t + "\t\t" + declination  + "\n"   
end

window :title => "2013 Analemma Data" do
  stack do
    para "Today is " + Date.today.to_s
    para "Start Date = #{start}"
    para "Finish Date = #{finish}"
    para "Date\t\t\t Delta Time\t\t Declination Degrees"
    para data.each {|line| line}
end
end

