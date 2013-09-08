#require 'string_extensions' # does not work.
# require "string_extensions" # double quotes doesn't matter either.
# try
# require './string_extensions' # works as long as the required file is in the same directory.
load 'string_extensions.rb'
puts "This is a test".vowels.join('-')