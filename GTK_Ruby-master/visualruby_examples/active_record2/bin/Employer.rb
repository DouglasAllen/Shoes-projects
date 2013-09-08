
class Employer < ActiveRecord::Base
	has_many :employees

	include GladeGUI

	def show()
		load_glade(__FILE__)
		set_glade_all
		show_window()
	end

	def to_s
		name
	end

end
