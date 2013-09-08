#t_w_mp3_player.rb
Shoes.app do
  button( 'play' ){ @v.play }
  button( 'pause' ){ @v.pause }
  button( 'stop' ){ @v.stop }
  @v = video "/home/kb9agt/Githubreposmine/GTK_Ruby/red_shoes/ruby.mp3"
end 
