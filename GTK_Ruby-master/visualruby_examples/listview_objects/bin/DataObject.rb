

class DataObject

	include GladeGUI

	def initialize(name, address, email, phone)
		@name = name
		@address = address
		@email = email
		@phone = phone
	end

	def show()
		load_glade(__FILE__)  #loads file, glade/DataObjectGUI.glade into @builder
		set_glade_all() #populates glade controls with insance variables from DataObject 
		show_window() 
	end	

	def buttonSave__clicked(*args)
		get_glade_variables()
		destroy_window()
	end

	def to_s
		"#{@name}  (#{@email})"
	end

	def visual_attributes()
		{ :background => email_valid? ? "white" : "yellow" }
	end

	def email_valid?
		  @email =~ /\A[\w\._%-]+@[\w\.-]+\.[a-zA-Z]{2,4}\z/  
	end

end
