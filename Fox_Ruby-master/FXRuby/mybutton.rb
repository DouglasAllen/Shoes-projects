require 'fox16'

include Fox

theApp = FXApp.new

theMainWindow = FXMainWindow.new(theApp, "Hello")
theButton = FXButton.new(theMainWindow, "Hello, World!")
theButton.connect(SEL_COMMAND) {
puts "You have clicked the button. Good bye!"
exit}
	
theApp.create

theMainWindow.show

theApp.run