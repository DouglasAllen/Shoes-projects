#doctest: factorial should give correct results for 0 to 2

>> factorial(0)	

=> 1

	
>> factorial(1)

	
=> 1

#

# doctest: this is how it works with 2:

	
>> factorial(2)

	
=> 2

def factorial(n)

  if n == 0

    1

  else

    n * factorial(n-1)

  end

end

#

	
# doctest: should work for 3, too

	

	
>> factorial(3)

	
=> 6

