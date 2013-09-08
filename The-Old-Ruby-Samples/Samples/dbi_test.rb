# dbi_test.rb

require 'dbi'

begin
  dbh = DBI.connect('DBI:SQLite3:test', 'testuser', 'testpwd')
  puts dbh.handle
  puts dbh.driver_name
  puts dbh.connected?
  puts dbh.database_name
   #~ puts dbh.methods
  dbh.prepare("") do |sth| 
    sth.execute 
    puts "Databases: " + sth.fetch_all.join(", ") 
  end
	
rescue DBI::DatabaseError => e 
  puts "An error occurred" 
  puts "Error code: #{e.err}" 
  puts "Error message: #{e.errstr}" 
ensure 
  dbh.disconnect if dbh 
end

=begin
# Insert some rows, use placeholders
    1.upto(13) do |i|
        sql = "insert into simple01 (SongName, SongLength_s) VALUES (?, ?)"
        dbh.do(sql, "Song #{i}", "#{i*10}")
    end 
    
    # Select all rows from simple01
    sth = dbh.prepare('select * from simple01')
    sth.execute
    
    # Print out each row
    while row=sth.fetch do
        p row
    end
    
    # Close the statement handle when done
    sth.finish
    
    # Don't prepare, just do it!
    dbh.do('delete from simple01 where internal_id > 10')
      
    # And finally, disconnect
    dbh.disconnect
        
    # Same example, but a little more Ruby-ish
    DBI.connect('DBI:SQLite3:test', 'testuser', 'testpwd') do | dbh |
      
        sql = "insert into simple01 (SongName, SongLength_s) VALUES (?, ?)"
        
        dbh.prepare(sql) do | sth | 
            1.upto(13) { |i| sth.execute("Song #{i}", "#{i*10}") }
        end 
        
        dbh.select_all('select * from simple01') do | row |
            p row
        end
        
        dbh.do('delete from simple01 where internal_id > 10')
      
    end
=end