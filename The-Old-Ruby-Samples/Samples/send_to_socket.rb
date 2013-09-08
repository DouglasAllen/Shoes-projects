require 'socket'

arr = []
TCPSocket.open("localhost", 9292) {|s|
    s.send "GET / HTTP/1.1\r\n\r\n", 0
    arr << s.read
  }
  
  puts arr
  
#~ Addrinfo.tcp("0.0.0.0", 0).listen {|serv|
    #~ p serv.connect_address #=> #<Addrinfo: 127.0.0.1:53660 TCP>
    #~ serv.connect_address.connect {|c|
      #~ s, _ = serv.accept
      #~ p [c, s] #=> [#<Socket:fd 4>, #<Socket:fd 6>]
    #~ }
  #~ }  