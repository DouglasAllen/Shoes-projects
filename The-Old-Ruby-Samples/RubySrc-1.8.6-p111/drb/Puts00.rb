# puts00.rb
require 'drb/drb'                                        # (1)

class Puts                                               # (2)
  def initialize(stream=$stdout)
    @stream = stream
  end

  def puts(str)
    @stream.puts(str)
  end
end

#~ uri = ARGV.shift
uri = 'druby://localhost:12345'
DRb.start_service(uri, Puts.new)                        # (3)
puts DRb.uri
sleep                                                   # (4)

=begin
http://www2a.biglobe.ne.jp/~seki/ruby/druby.html

3 Hello, dRuby.

% ruby puts00.rb druby://localhost:12345
druby://localhost:12345

open irb --simple-prompt

> require 'drb/drb'
=> true
> there = DRbObject.new_with_uri('druby://localhost:12345')
=> #<Puts:0xb4dc08>
> there.__drburi
=> "druby://localhost:12345"
there.puts('Hello, World.')

result at terminal

% ruby puts00.rb druby://localhost:12345
druby://localhost:12345
Hello, World.

=end