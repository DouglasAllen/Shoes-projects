
class ListViewObjectsGUI < ListViewObjects

	include GladeGUI

	def show()
		load_glade(__FILE__)  #loads file, glade/MyClass.glade into @builder
		@builder["scrolledwindow1"].add(self)
		@builder["window1"].resize 700, 360
		select_row(0) #in VR::ListView
		renderer(:quote).edited_callback = method(:selection__changed) 
		show_window() 
	end	

	def selection__changed(*args)
		return unless row = selected_rows.first  # iter = selection.selected
		@builder["labelQuote"].label = row[:quote].text 
	end


end

