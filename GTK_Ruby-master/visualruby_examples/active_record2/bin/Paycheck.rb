
class Paycheck < ActiveRecord::Base
	belongs_to :employee

	include GladeGUI

	def show()
		load_glade(__FILE__)
		set_glade_all
		show_window()
	end

	def to_s
		sprintf("%.2f", amount)
	end

end
