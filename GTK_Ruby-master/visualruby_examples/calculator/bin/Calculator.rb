##  
#  This class is a GUI for a calculator.  The show() method
#  loads the Calculator.glade file using the line:
#  
#  load_glade(__FILE__)
#  
#  The instance variable, @builder is a reference to the
#  Gtk::Builder object.  @builder["window1"] is a reference to
#  the main window of the calculator.  So, if you edit
#  the Calculator.glade file (using glade) you'll see that
#  the top window is named "window1."  (Always keep the name
#  "window1"!)
#  
#  In glade, you'll see that the names of the keys are:
#  
#  Calculator.keys[0]
#  Calculator.keys[1] ...etc.
#  
#  This corresponds to the array @keys.  Visual Ruby's library
#  will automatically load the values of the array into the
#  glade form using this line:
#  
#  set_glade_variables(self)
#  
#  This line causes GladeGUI to search all the instance variables
#  and fill-in widgets that match the vaiable names.
#  

class Calculator

	include GladeGUI

	def show()
		load_glade(__FILE__)
		@builder["window1"].title = "Calculator"
		@keys =		[	1,	2,	3, "C" ] +
							[	4,	5,	6, "+" ] +
							[ 7,	8,	9, "-" ] +
							[ 0, ".","/","=" ]
		set_glade_variables(self)  
		show_window()
	end	

#  This method is called when a key is clicked.  It follows
#  this naming convention: <glade_name>__<signal_name>.  (Separator is
#  two underscores.  This tells GladeGUI to connect all the
#  "clicked" signals to this method.  It matches the glade
#  names "keys", "keys[x]" or "Calculator.keys[x]" to this method
#  automatically for all the buttons.  Look at the names
#  of the keys in glade by right clicking on Calculator.rb

	def keys__clicked(button)
		case button.label
			when "C" then @builder["display"].text = ""
			when "=" then
				begin # this doesn't catch all errors
				 	@builder["display"].text = eval(@builder["display"].text).to_s
				rescue
					@builder["display"].text = "error"
				end
			else @builder["display"].text = @builder["display"].text + button.label
		end	 
	end	

end

