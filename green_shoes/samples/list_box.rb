require 'green_shoes'
Shoes.app do
  para "Here is a list box:"
  list_box :items => ["cat", "hat"], :choose => "cat"
end