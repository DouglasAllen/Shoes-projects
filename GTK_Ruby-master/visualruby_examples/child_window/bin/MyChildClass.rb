##
#  This shows how to make child windows that close when 
#  their parent window closes.  
#
#  Passing a reference to the parent to load_glade() solves all the 
#  complications of running the child and parent simultaniously.
#
#  The passing the parent to load_glade() does three things:
#
#  1) It registers the parent window (using  win.transient_for=parent ) 
#  2) It causes show_window() to run the child in the main window's 
#     Gtk.main loop, instead of starting its own loop.
#  3) It causes destroy_window() to destroy only the child without
#			calling Gtk.main.quit, so the main program's loop continues after 
#     the child is destroyed.
#
#  So, just pass a reference to the parent to load_glade for all child windows, 
#  and everyting will be done automatically:
#
class MyChildClass #(change name)

	include GladeGUI

	def show(parent)
		load_glade(__FILE__, parent)  # now child will close with parent
		@hello = "If you close my parent window I will close too."
		set_glade_variables(self) # fills label with message
		@builder["window1"].title = "MyChildClass" 
		show_window()
	end	
	
	# When cancel clicked in MyChildClass.glade
	def buttonCancel__clicked(*argv)  
		destroy_window() 
	end

end

#  Note these lines are unnecessary:
#  
#		@hello = "If you close my parent window I will close too."
#		set_glade_all(self) # fills label with message
#		@builder["window1"].title = "MyChildClass" 
#  
#  It is better practice to simply set MyChildClass.hello's text using glade.
#  Its only included to illustrate that GladeGUI will auto-fill
#  from instance variables.
#  
#  Window1's title should also be set using glade.
#  Also, setting cancelButton's clicked signal to "destroy_window"
#  will eliminate those line of code as well.
#

