require 'base64'

puts Base64.encode64('testing')
puts Base64.encode64(File.read('./ctlClockLib.dll'))