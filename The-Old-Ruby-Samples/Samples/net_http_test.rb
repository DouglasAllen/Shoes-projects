require 'net/http'
Net::HTTP.start( 'www.ruby-lang.org', 80 ) do |http|
  #print( http.get( '/en/about/LICENSE.txt' ).body )
  system 'ruby simple_sinatra.rb'# % http.get( '/en/feeds/news.rss' )'
end