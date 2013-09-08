require 'win32/pipe'
include Win32

# In client.rb (run from a different shell)
pipe_client = Pipe::Client.new("foo_pipe")
pipe_client.write("Hello World")
pipe_client.close