require 'vlcrc'

# Create a new VLC object, which attempts to connect
#vlc = VLCRC::VLC.new #localhost, 1234
# Start playing a file

vlc = VLCRC::VLC.new 'localhost', 1234

vlc.media = "/home/kb9agt/Githubreposmine/GTK_Ruby/visualruby_examples/AdventureTimewithFinnandJakeFinnTime.mpg"
# Launch an instance of VLC bound to the above socket
#vlc.launch

# Connect to it (have to wait for it to launch though)
until vlc.connected?
  sleep 0.1
  vlc.connect
end

# ruby use_vlcrc.rb 
