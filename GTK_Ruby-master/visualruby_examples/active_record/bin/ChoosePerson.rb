
class ChoosePerson < VR::ListView

	include GladeGUI

	def initialize()
		super(:person => Person)  # Person class
	end


	def show()
		load_glade(__FILE__)  #loads file, glade/MyClass.glade into @builder
		@builder["window1"].resize 450, 220
		@builder["scrolledwindow1"].add(self)
		Person.all.each do |p|
			row = add_row(:person => p)
		end 
		show_window()
	end	


end
