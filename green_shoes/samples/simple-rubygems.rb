require 'green_shoes'
#
# The setup block will install gems before launching the 
# rest of the app below it.
#
#~ Shoes.setup do
  #~ gem 'bluecloth =2.0.6'
  #~ gem 'metaid'
  #~ gem 'equation_of_time'
#~ end

require 'bluecloth'
require 'metaid'
require 'equation_of_time'

Shoes.app :width => 300, :height => 400, :resizable => false do
  background "#eed"

  stack :margin => 40 do
    tagline "Loaded Gems:", :align => "center", :underline => "single"
    Gem.loaded_specs.each do |name, spec|
      para "#{name}\n#{spec.version}", :align => "center"
    end

    caption "Total Gems: #{Gem::Specification.all.length}", :align => "center", :margin_bottom => 0
    para "(includes unloaded gems)", :align => "center", :margin_top => 0
    button "OK", :bottom => 30, :left => 0.4 do
      self.close
    end
  end

end
