#---
# Excerpted from "FXRuby: Create Lean and Mean GUIs with Ruby",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/fxruby for more book information.
#---
require 'fox16'

include Fox

class VerticalFrameExample < FXMainWindow
  
  def initialize(app)
    super(app, "Vertical Frame Example", :width => 400, :height => 200)

    vframe = FXVerticalFrame.new(self,
      :opts => PACK_UNIFORM_WIDTH|PACK_UNIFORM_HEIGHT)
    child1 = FXButton.new(vframe, "This is a short button")
    child2 = FXButton.new(vframe, "This one is a\nlittle taller")
    child3 = FXButton.new(vframe, "This button is\nthree lines\ntall")

  end
  
  def create
    super
    show(PLACEMENT_SCREEN)
  end
  
end

if __FILE__ == $0
  FXApp.new do |app|
    VerticalFrameExample.new(app)
    app.create
    app.run
  end
end