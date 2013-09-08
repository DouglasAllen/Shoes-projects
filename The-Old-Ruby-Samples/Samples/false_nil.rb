glass_cup = nil
plastic_cup = "" # make platic cup not nil or false. 

if plastic_cup
	print "Plastic cup is on the up 'n' up!\n"
end
unless plastic_cup
	print "Plastic cup is on the down low.\n"
end
print "Yeah, plastic cup is up again!\n" if plastic_cup
print "Hardly. It's down.\n" unless plastic_cup
print "We're using plastic 'cause we don't have glass.\n" if plastic_cup unless glass_cup

plastic_cup = nil # make platic cup nil and check again. 
if plastic_cup
	print "Plastic cup is on the up 'n' up!\n"
end
unless plastic_cup
	print "Plastic cup is on the down low.\n"
end
print "Yeah, plastic cup is up again!\n" if plastic_cup
print "Hardly. It's down.\n" unless plastic_cup
print "We're using plastic 'cause we don't have glass.\n" if plastic_cup unless glass_cup

plastic_cup = false
if plastic_cup
	print "Plastic cup is on the up 'n' up!\n"
end
unless plastic_cup
	print "Plastic cup is on the down low.\n"
end
print "Yeah, plastic cup is up again!\n" if plastic_cup
print "Hardly. It's down.\n" unless plastic_cup
print "We're using plastic 'cause we don't have glass.\n" if plastic_cup unless glass_cup

