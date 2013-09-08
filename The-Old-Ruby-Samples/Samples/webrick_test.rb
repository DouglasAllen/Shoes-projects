require 'webrick'

  root = File.expand_path '~/public_html'
  server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root

# To run the server you will need to provide a suitable shutdown hook
# as starting the server blocks the current thread: 

  trap 'INT' do server.shutdown end

  server.start
