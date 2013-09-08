
class SongListViewGUI < SongListView

	include GladeGUI


	def show()
		load_glade(__FILE__)  #loads file, glade/MyClass.glade into @builder
		@builder["scrolledwindow1"].add_child(@builder, self)
		@builder["window1"].resize 800, 530
		@builder["window1"].show_all
		show_window()
	end		

	def self__row_activated(*argv)
		return unless rows = selected_rows
		row = rows[0]
		VR::Dialog.message_box("You selected\n#{row[:song]}\nby  #{row[:artist]}")
	end

	def invisible__toggled(*argv)
		v = !@builder["invisible"].active?
		col_visible(:last_name => v, :first_name => v ) 
	end

	def radio__toggled(*argv)
		ren_radio(:check => @builder["radio"].active?)
		each_row { |r| r[:check] = false }
		repaint
	end

	def background__toggled(*argv)
		val = @builder["background"].active? ? "yellow" : "white"
		ren_attr(:song, :background => val) # same as set_background( SONG => val)
		repaint
	end

	def xalign__toggled(*argv)
		val = @builder["xalign"].active? ? 1 : 0
		ren_xalign(:artist => val)
		repaint
	end

	def bold__toggled(*argv)
		val = @builder["bold"].active? ? Pango::WEIGHT_BOLD : Pango::WEIGHT_NORMAL
		ren_weight(:song => val) #number from 100 to 900, BOLD = 700
		repaint	
	end

	def center__toggled(*argv)
		val = @builder["center"].active? ? 0.5 : 0
		col_alignment(:artist => val) 
		repaint
	end
	
	def editable__toggled(*argv)
		ren_editable(!@builder["editable"].active?)		
	end

	def digits__toggled(*argv)
		val = @builder["digits"].active? ? 1 : 0
		ren_digits(:quantity => val)
		repaint
	end

	def repaint
		@builder["scrolledwindow1"].hide
		@builder["window1"].show_all
	end
end


