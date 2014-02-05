
$: << ENV['GEM_HOME']
$: << 'lib'
require 'shoes'


require 'shoes/configuration'
Shoes.configuration.backend = :swt

Symbol.all_symbols.sort.each {|name| puts name}

