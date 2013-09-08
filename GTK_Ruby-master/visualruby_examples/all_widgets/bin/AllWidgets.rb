##
#  This file shows all the widget types that auto-fill when you
#  call set_glade variables().  You can use any type of
#  widget in your programs, but you'll need to populate
#  them yourself using the @builder for your class.  An example 
#  of using the @builder to populate a widget is in the code
#  below:   The checkbutton is populated automatically with
#  the value "true," but the label of the checkbutton needs
#  to be set in glade, or here in your code.  This line set the
#  label:
#  
#  @builder["checkbutton1"].label = "I'm a Check Button" 
#  
#  You can see the result when you run the program.
#
#  Note: you must add an "adjustment" object to the spinbutton in glade
#  to make it work.
#

class AllWidgets

	include GladeGUI

	def show()
		load_glade(__FILE__)  #loads file, glade/MyClass.glade into @builder
		@label1 = "I'm a Label"
		@checkbutton1 = true
		@builder["checkbutton1"].label = "I'm a Check Button" #this could be set in glade
		@image1 = "bin/splash.png"
		@linkbutton1 = "http://www.visualruby.net"
		@entry1 = "I'm an Entry Box"
		@progressbar1 = 0.85  # text property set in glade
		@textview1 = "I'm a Textview"
		@spinbutton1 = 10.5
		@fontbutton1 = "Courier 10"
		@calendar1 = DateTime.new(2011, 5, 14)
		set_glade_variables() #populates glade controls with insance variables (i.e. Myclass.label1) 
		show_window() 
	end	


end

