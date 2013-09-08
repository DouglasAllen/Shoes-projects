# This initializes our library
#require 'gtk2'
require 'libglade2'
# This is a callback method. The data argument is ignored.
def hello( widget )
   puts "Hello World button clicked"
end

def delete_event( widget, event )

   # If you return false in the "delete_event" signal handler,
   # GTK will emit the "destroy" signal. Returning true means
   # that you don't want the window to be destroyed.
   # This is useful for popping up 'are you sure you want to quit?'
   # type dialogs.
   puts "delete event occurred."

   # Change true to false and the main window will be destroyed with
   # a "delete_event".
   return false
end

# Another callback
def destroy( widget )
   Gtk.main_quit
end

# This is called in all Ruby-GNOME2 applications.
Gtk.init

# Create a new window.
window = Gtk::Window.new( Gtk::Window::TOPLEVEL )

# Sets the window title.
window.set_title( "helloworldgtk.rb" )

# Sets the border width of the window.
window.set_border_width( 10 )

# When the window is given the "delete_event" signal (this is given
# by the window manager, usually by the "close" option, or on the
# titlebar), we ask it to call the delete_event method
# as defined above. The data passed to the callback
# method is nil and is ignored in the callback method.
window.signal_connect( "delete_event" ) {
   delete_event( nil, nil )
}

# Here we connect the "destroy" event to a signal handler.
# This event occurs when we call Gtk::Widget#destroy on the window,
# or if we return false in the "delete_event" callback.
window.signal_connect( "destroy" ) {
   destroy( nil )
}

# Creates a new button with the label "Hello World".
button = Gtk::Button.new( "Hello World" )

# When the button receives the "clicked" signal, it will call the
# method hello, passing it nil as the argument. The hello
# method is defined above.
button.signal_connect( "clicked" ) {
   hello( nil ) 
}

# This packs the button into the window( a Gtk::Container )
window.add( button )

# The final step is to display the newly created widget
button.show

# And the window
window.show

# All Ruby-GNOME2 applications must have a Gtk.main. Control ends here
# and waits for an event to occur ( like a key press or mouse event ).
Gtk.main
