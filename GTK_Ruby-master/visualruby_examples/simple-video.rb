require 'sdl'

SDL.init( SDL::INIT_VIDEO|SDL::INIT_AUDIO )
SDL::Mixer.open

screen = SDL::Screen.open( 352, 240, 16, SDL::SWSURFACE )

mpeg = SDL::MPEG.load( 'AdventureTimewithFinnandJakeFinnTime.mpg' )
info = mpeg.info

puts info
mpeg.enable_audio true
mpeg.enable_video true

#mpeg.set_display(screen)
#mpeg.set_display_region( 0, 0, screen.w, screen.h )

  
Shoes.app {
  para mpeg.set_display(screen)
  para mpeg.set_display_region( 0, 0, screen.w, screen.h )
  mpeg.play    
}
