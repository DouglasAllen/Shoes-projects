require 'gtk2'

Gtk.init

vbox = Gtk::VBox.new 2
button = Gtk::Button.new 'Get the Gimp'
entry = Gtk::Entry.new
entry.text = 'Hello?'
window = Gtk::Window.new 'GTK2 Works!'
window.border_width = 5
window.add vbox
vbox.pack_start button
vbox.pack_start entry
window.show_all

Gtk.main
