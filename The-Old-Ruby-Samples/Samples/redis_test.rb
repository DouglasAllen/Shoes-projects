require 'redis'
r = Redis.new()

# Keys:

r.set("redis_db", "great k / v storage")       # => OK
r.get("redis_db")                                          # => "great k / v storage"