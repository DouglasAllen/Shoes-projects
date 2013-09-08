# my_mp3player07.rb
$BASE_PATH = "C:/rubyprograms/Shoes/mp3player/"

Shoes.app :width => 300, :height =>165 do
  background green
  background rgb(255,208,208), :radius => 24
  caption 'My original tiny MP3 player!'
  
  stack :left => 0, :top => 30 do
    @img = image $BASE_PATH + "loogink.png"
    n = 0
    animate(5) do
      @img.move( (n+=1) % 300 , 10 - rand(10))  if !@file.nil? && @v.playing?
    end
  end
  
  stack :left => 0, :top => 70 do
    @l = para('', :stroke => white)
    animate do
      @l.replace strong "#{@file} : #{@v.time.to_i / 1000} sec"  unless @file.nil?
    end
  end
  
  flow :left => 0, :top => 120  do
    button 'select?' do
      tmp = @file
      (@v = video(@file)  unless (@file = ask_open_file).nil?)  if @file.nil? || !@v.playing?
      @file ||= tmp
    end
    button( 'play' ){ @v.play }
    button( 'pause' ){ @v.pause }
    button( 'stop' ){ @v.stop }
  end
end