 
##
#  This is a "main" GUI class for a program.  It will spawn
#  child windows that must close when MyClass's window closes
#  It starts a Gtk.main loop by calling show_window(). 
#  When the user clicks the "X" button, the window will be 
#  automatically destroyed, and Gtk.main.quit will be called, terminating
#  the Gtk.main loop.  This happens because this window's destroy
#  signal has been set in glade to: destroy_window.
#  
#  If you don't understand, don't worry.  Here's what you
#  need to know:
#  
#  1) Call load_glade(__FILE__) to load the MyClass.glade file
#  2) Call show_window() (window appears)
#  3) You can terminate the loop by calling destroy_window() 
#  

class MyClass #(change name)

	include GladeGUI

	def show()
		load_glade(__FILE__)  #loads file, glade/MyClass.glade into @builder
		@builder["window1"].title = "MyClass" # appears in window title bar
		show_window()  #calls Gtk.main
	end	

	def buttonOpenChild__clicked(*argv)
		child_win = MyChildClass.new() #self = parent
		child_win.show(self)
	end

	def modalButton__clicked(*argv)
		modal_win = MyModalClass.new 
		modal_win.show(self)
	end

	# This method is unnecessary, see MyModalClass.
	def cancelButton__clicked(*argv)
		destroy_window()
	end

end



