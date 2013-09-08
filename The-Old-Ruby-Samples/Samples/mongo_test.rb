#require 'mongo'
require 'mongo_mapper'

MongoMapper.connection = Mongo::Connection.new()
MongoMapper.database = 'mydatabase'

class Person
  include MongoMapper::Document
  
  key :first_name, String
  key :last_name, String
  key :age, Integer
  key :born_at, Time
  key :active, Boolean
  key :fav_colors, Array
end

person = Person.create({
  :first_name => 'John',
  :last_name => 'Nunemaker',
  :age => 27,
  :born_at => Time.mktime(1981, 11, 25, 2, 30),
  :active => true,
  :fav_colors => %w(red green blue)
})
person.save
id = person.id
#puts person.methods
puts person.first_name + " " + person.last_name
puts "is #{person.age} years old,"
puts "active = #{person.active},"
puts "#{person.fav_colors} are thier favorite colors"
Person.destroy(id)
