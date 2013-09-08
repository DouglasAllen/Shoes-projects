
Readline = Struct.new(:release, :version, :url, :files, :target)
rlfiles = Readline.new
rlfiles.url = "http://www.rin-shun.com/shoes/MinGW/downloads"
rlfiles.files = ['readline-5.0-bin.zip', 'readline-5.0-lib.zip']
ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))
puts ROOT

   # Create a structure with a name in Struct
Struct.new("Customer", :name, :address)    #=> Struct::Customer
Struct::Customer.new("Dave", "123 Main")   #=> #<struct Struct::Customer name="Dave", address="123 Main">

   # Create a structure named by its constant
Customer = Struct.new(:name, :address)     #=> Customer
Customer.new("Dave", "123 Main")           #=> #<struct 