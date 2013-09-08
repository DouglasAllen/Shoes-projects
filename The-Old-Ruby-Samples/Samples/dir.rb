# rlcr_w04_ex05.rb

#Exercise5. Difficulty level: MEDIUM Write a one-line Ruby script that displays on the screen all the files in the current folder 
#as well as everything in all its sub folders, in sorted order.

# Make use of Dir.glob method as follows:
#Dir.glob('**/*')
#Name this program inventory.rb.

#~ puts Dir.glob('**/*').sort.split(",")	
File.open('inventory.txt', mode='w') do |f|
	f << Dir.glob('**/*').sort	
end

File.open('inventory.txt', mode='r') do |lines|
	lines.each {|line| puts line.split(",")}
end
#~ puts Dir.[]

#~ system 'ruby -e \'puts Dir.glob("**\*").sort\''
