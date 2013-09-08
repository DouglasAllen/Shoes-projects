require 'win32/pipe'
include Win32

# In server.rb
pipe_server = Pipe::Server.new("foo_pipe")
pipe_server.connect
data = pipe_server.read
puts "Got #{data} from client"
pipe_server.close

# # In client.rb (run from a different shell)
# pipe_client = Pipe::Client.new("foo_pipe")
# pipe_client.write("Hello World")
# pipe_client.close