require 'green_shoes'

Shoes.app do
  10.times do |i|
    flow :width => 0.5, :height=> 60 do
      background forestgreen#(0.1*(i+1))
      para 'hello'
    end
    flow :width => 0.5, :height=> 60 do
      background orangered#(1.0 - 0.1*i)
      para 'shoes'
    end
  end
end