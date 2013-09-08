# my_mp3player01.rb
Shoes.app  do
  button( 'play' ){ @v.play }
  button( 'pause' ){ @v.pause }
  button( 'stop' ){ @v.stop }
  @v = video "C:/rubyprograms/Shoes/mp3player/ruby.mp3"
end