require 'green_shoes'

Shoes.app do
  10.times do |i|
    flow(width: 0.5, height: 30){background forestgreen(0.1*(i+1)); para 'hello'}
    flow(width: 0.5, height: 30){background orangered(1.0 - 0.1*i); para 'shoes'}
  end
end