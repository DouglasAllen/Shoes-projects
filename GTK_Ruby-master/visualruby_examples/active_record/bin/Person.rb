class Person < ActiveRecord::Base

		include GladeGUI

		def show()
			load_glade(__FILE__)
			set_glade_all()
			show_window()
		end

		def to_s
			"#{self.name}  (#{self.email})" 
		end

end
