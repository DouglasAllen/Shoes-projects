#~ require 'green_shoes'
#~ Shoes.app do

  
  #~ alert_proc = Proc.new {alert "This Works!"}
  
  #~ para "Click Me", stroke: blue, click: alert_proc
  #~ para "Click anywhere", stroke: blue, click{alert_proc.call}

  #~ alert_proc.call  
  #~ button("Click me!") {alert_proc.call } 

  #~ para "Click Me", stroke: blue, click: alert_proc.call
  #~ para  "Click Me", stroke: blue do |click|
    #~ click do
      #~ alert_proc.call
    #~ end
  #~ end 
  

    #~ alert_proc = Proc.new {alert "This Works!"}
    #~ para link("Click Me", &alert_proc)
#~ end
Shoes.app do
  style Link, underline: nil, stroke: green
  style LinkHover, underline: nil, stroke: red
  alert_proc = Proc.new {alert "This Works!"}
  para link("Click Me", &alert_proc)
end
  
  
