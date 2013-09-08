Fight a battle by turns
=======================

Now, my rabbit can fight a monster one-on-one like this:

	d = Dragon.new
	r = Rabbit.new
	r ^ d

But, Dwemthy's Array is an array, not an creature itself. How do I define Dwemthy's Array?!

Look at the [class DwemthysArray](http://github.com/ashbb/dwemthys_array_study_note/blob/master/whys_code/dwemthy.rb). \_why uses the mehtod `method_missing`.

Let me try hacking!

