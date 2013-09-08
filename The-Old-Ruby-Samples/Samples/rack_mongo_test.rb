require 'mongo'

@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("testing")
p @db.name
p @db.collections.count
p @db.collection_names

#p @db.connection
#~ p @db.strict?
#~ p @db.safe
#~ p @db.cache_time
#~ p @db.read_preference
#~ p @db.tag_sets
#~ p @db.acceptable_latency

#p @db.collections
#~ p @db.collections_info
#~ p @db.object_id.hash
@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("test")
p @db.name
p @db.collections.count
p @db.collection_names
#~ 
@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("#app_w_mongo-development")
p @db.name
p @db.collections.count
p @db.collection_names
@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("blog_development")
p @db.name
p @db.collections.count
p @db.collection_names
@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("blog")
p @db.name
p @db.collections.count
p @db.collection_names
@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("m101")
p @db.name
p @db.collections.count
p @db.collection_names
@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("mydatabase")
p @db.name
p @db.collections.count
p @db.collection_names
@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("mydb")
p @db.name
p @db.collections.count
p @db.collection_names
@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("pcat")
p @db.name
p @db.collections.count
p @db.collection_names
@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("reddit")
p @db.name
p @db.collections.count
p @db.collection_names
@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("school")
p @db.name
p @db.collections.count
p @db.collection_names
@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("students")
p @db.name
p @db.collections.count
p @db.collection_names
@db = Mongo::Connection.new([:server => 'localhost'],[:port => 27017]).db("yourdb")
p @db.name
p @db.collections.count
p @db.collection_names