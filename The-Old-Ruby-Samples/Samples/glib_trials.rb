require 'glib2'

puts $0
puts __FILE__
env = []
GLib.listenv.each {|e| env << GLib.getenv(e) }

list = env.sort
# puts list

path0 = GLib.getenv("PATH").split(/;/)
path_list = path0.sort
# puts path_list
puts GLib.home_dir
puts GLib.host_name