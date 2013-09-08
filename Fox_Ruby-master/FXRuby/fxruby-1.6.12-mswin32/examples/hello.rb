#!/usr/bin/env ruby

require 'fox16'

include Fox

=begin
theApp = FXApp.new

theMainWindow = FXMainWindow.new(theApp, "Hello")
FXButton.new(theMainWindow, "Hello, World!")
theButton.connect(SEL_COMMAND) do |sender, selector, data|
  exit
end
theApp.create

theMainWindow.show

theApp.run
=end

application = FXApp.new#("Hello", "FoxTest")
main = FXMainWindow.new(application, "Hello")#, nil, nil, DECOR_ALL)
FXButton.new(main, "&Hello, World!", nil, application, FXApp::ID_QUIT)
application.create#()
main.show(PLACEMENT_SCREEN)
application.run()
