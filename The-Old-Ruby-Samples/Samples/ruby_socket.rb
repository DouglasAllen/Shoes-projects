require 'socket'
addrinfo = Socket.getaddrinfo("www.ruby-lang.org", "http", nil, :STREAM)
p addrinfo
puts
for line in Socket.getaddrinfo('www.microsoft.com', 'http')
  puts line.join(", ")
end
puts
for line in Socket.getaddrinfo('microsoft.com', 'http')
  puts line.join(", ")
end
puts
for line in Socket.getaddrinfo('www.microsoft.net', 'http')
  puts line.join(", ")
end
puts
for line in Socket.getaddrinfo('microsoft.net', 'http')
  puts line.join(", ")
end
puts
for line in Socket.getaddrinfo('msdn.microsoft.com', 'http')
  puts line.join(", ")
end
puts
for line in Socket.getaddrinfo('www.msdn.microsoft.com', 'http')
  puts line.join(", ")
end
puts
for line in Socket.getaddrinfo('msdn.microsoft.com/netframework/downloads/updates/default.aspx', 'http')
  puts line.join(", ")
end
puts

