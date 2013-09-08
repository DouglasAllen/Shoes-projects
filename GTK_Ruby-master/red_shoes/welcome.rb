require 'bloops'
Shoes.app {  
  # the bloops o' phone
  b = Bloops.new
  b.tempo = 30
  s2 = b.sound Bloops::NOISE
  s2.punch = 0.9
  s2.sustain = 0.0
  s2.decay = 0.1
  s2.slide = -0.0
  s2.phase = 0.0
  s2.psweep = 0.0
  b.tune s2, "8:C 2:G"
  b.play
  animate(3) {
       
    @time = Time.now
    @year = para @time.strftime("%Y")    
    @combo = para @weekday, @date_string
    @combo.style(:stroke => white)    
    b.play 
    
    clear {
      stack {
        background "#DFA"
        @welcome = para "Welcome to shoes!"
        @weekday = "It's " + @time.strftime("%A")
        @weekdaystyle = para @weekday
        @weekdaystyle.style(:stroke => green)
        @date = @time.strftime(" %b %d %Y ")
        @date_string = para @date
        @date_string.style(:stroke => blue)
        @hours = @time.strftime("%I")
        @minutes = @time.strftime("%M")
        @seconds = @time.strftime("%S")
        @newtime = para @hours + ":" + @minutes + ":" + @seconds
        @newtime.style(:stroke => orange)
        para "Put that in your clock and stroke it."
        }
      }      
    }      
}
