require 'fox16'
include Fox

require "find"
require "fileutils"

#SUBCLASS FOR CREATING A WINDOW, CONTAINS ALL THE CUSTOMISATION INFORMATION
class ScriptGui < FXMainWindow
	
	def initialize(app)
		super(app, "Script", :width => 700, :height => 200)
		frame = FXVerticalFrame.new(self, LAYOUT_LEFT|LAYOUT_FILL_X)
		
		#FRAMES FOR INPUT
		frame1 = FXHorizontalFrame.new(frame, LAYOUT_SIDE_TOP|FRAME_NONE|LAYOUT_FILL_X|LAYOUT_FILL_Y)    
		inputFileA = FXButton.new(frame1, "Input File")
		
		inputFileA.connect(SEL_COMMAND) do #the connect will ensure the following block is performed
		dialog = FXFileDialog.new(self, "Select file")
		dialog.patternList = ["Text Files (*.txt)", "All Files (*)"]     #recognised file types
		dialog.selectMode = SELECTFILE_EXISTING                                   #select a file
		if dialog.execute != 0                                                                #display the box and wait for user response
			@aInput.text = dialog.filename                                            #if the user selects a file, write it in inputfield
		end
	end
	
	@aInput = FXTextField.new(frame1, 90, :opts => JUSTIFY_LEFT|FRAME_SUNKEN|FRAME_THICK)
    
	FXHorizontalSeparator.new(frame, :opts => LAYOUT_FILL_X|SEPARATOR_GROOVE)
    
	buttonCode = FXButton.new(frame, "Run").connect(SEL_COMMAND, method(:matcher))                         #call method matcher to commence process
end
  
def matcher(sender, selector, data)

	#set up hash for itemC and doc ID
	@hashMapping = Hash.new {|h,k| h[k] = []}
    
	#process loadfile to capture doc ID's & itemC values.
	IO.foreach(@aInput.to_s) do |data|                                                 #go through the input concordance loadfile
		fields = data.split(" ")                                                            #split the field on this 
		itemA = fields[13].delete("þ").downcase                                          
		itemB = fields[0].delete("þ,\"")                                                     
		itemC = fields[35].delete("þ,\"")                                                     
		if itemA.to_s.downcase == "pdf"                    
			@hashMapping[itemC] << itemB                                                      
		end
	end
    
	Find.find(@aInput.to_s) do |curPath2|                                               
		if File.file?(curPath2) and curPath2[/\.txt$/] 
			itemCFN = File.basename(curPath2, ".txt").strip.to_s.downcase          #grabs the file name stripping whitespace
			finditemC(curPath2, itemCFN)                                                            
		end
	end
end
  
def finditemC(curPath2, itemCFN)                                                          
	@hashMapping.each do |itemDetail|
		@entryArray = []                                                                          
		entry = itemDetail.to_s.strip                                                            
		@entryArray << itemDetail.to_s.strip                                                
		if entry.match(/#{itemCFN}/)                                                          
			puts itemCFN
		end
	end
end

def create
	super
		show(PLACEMENT_SCREEN)       #SHOW THE GUI ON THE SCREEN
	end
end

#CONSTRUCTOR
if __FILE__ == $0
	FXApp.new do |app|
		ScriptGui.new(app)
		app.create#CALLS THE METHOD CREATE TO ENSURE ALL NEEDED INFO IS ADDED
		app.run#STARTS THE CREATION OF THE WINDOWS
	end
end