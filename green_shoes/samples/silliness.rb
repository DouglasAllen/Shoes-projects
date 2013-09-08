 
#Uncomment for Red Shoes (and vice versa)
#Shoes.setup do
  #gem 'snmp'
  #require 'snmp'
  #require 'optparse'
#end
#
#
#Uncomment for Green Shoes (and vice versa)
#begin
#  gem'green_shoes'
#rescue LoadError
#  system("gem install green_shoes")
#end
#begin
#  gem 'snmp'
#rescue LoadError
#  system("gem install snmp")
#end
#require 'green_shoes'
#require 'snmp'
 
class Conf
  class << self
    attr_accessor :hostname, :framerate, :vidtype, :videoformat, :videonumber, :browseformat, :browsenumber, :audioformat, :audionumber
    def hostname
      @hostname
    end
 
    def framerate
      @framerate
    end
 
    def vidtype
      @vidtype
    end
 
    def audioformat
      @audioformat
    end
 
    def videoformat
      @videoformat
    end
 
    def browseformat
      @browseformat
    end
 
    def audionumber
      @audionumber
    end
 
    def videonumber
      @videonumber
    end
 
    def browsenumber
      @browsenumber
    end
  end
end
 
#class Shoes
#  class App
#    def icon filename=nil
#      filename.nil? ? win.icon : win.icon = filename
#      Gtk::Window.set_default_icon(win.icon)
#    end
#  end
#end
#
# #Only call Gtk.main_quit once to avoid warnings or errors related to
## "no Gtk main loop running"
#class << Gtk; attr_accessor :running; end
#
#class Object
#  # Make sure Green Shoes does not crash on exit when exit is called with status
#  def exit(status=true)
#    if Gtk.running
#      Gtk.main_quit
#      File.delete Shoes::TMP_PNG_FILE if File.exist? Shoes::TMP_PNG_FILE
#      Gtk.running=false
#    end
#  end
##
##  # Override Green Shoes "confirm" method to provide dialog with a custom title
##  def confirm title, msg
##    $dde = true
##    dialog = Gtk::Dialog.new(
##    title,
##    get_win,
##    Gtk::Dialog::MODAL | Gtk::Dialog::DESTROY_WITH_PARENT,
##    [Gtk::Stock::OK, Gtk::Dialog::RESPONSE_ACCEPT],
##    [Gtk::Stock::CANCEL, Gtk::Dialog::RESPONSE_REJECT]
##    )
##    dialog.vbox.add Gtk::Label.new msg
##    dialog.set_size_request 500, 100
##    dialog.show_all
##    ret = dialog.run == Gtk::Dialog::RESPONSE_ACCEPT
##    dialog.destroy
##    ret
##  end
##
#end
 
class SNMPManager < Shoes
  url "/", :configure
  url "/settings", :check_settings
  url "/update", :update_capacity
 
  #include SNMP
  #attr_accessor :hostname, :framerate, :vidtype
  def initialize(params = {})
    # @step=0
    # Gtk.running=true
 
  end
 
  def LookupRatio(formatnumber)
    @lookup = {
      17=>"1.6",
      18=>"2",
      19=>"2.666666667",
      20=>"4",
      23=>"4",
      24=>"0.2",
      26=>"1.6",
      27=>"2",
      28=>"2.666666667",
      33=>"0.2",
      34=>"0.177777778",
      35=>"8",
      36=>"8",
      37=>"0.177777778",
      65=>"1.8",
      66=>"2.25",
      67=>"2.25",
      68=>"0.225",
      70=>"1.8",
      71=>"2.25",
      72=>"2.25",
      73=>"0.225",
      74=>"0.2",
      75=>"9",
      76=>"9",
      77=>"0.2",
      78=>"4.5",
      81=>"4.5",
      86=>"1.125",
      87=>"1.5",
      88=>"1.8",
      89=>"1.285714286",
      90=>"1.8",
      91=>"2.25",
      256=>"4.25",
      257=>"28.5",
      258=>"32.5",
      259=>"4.25",
      260=>"0.066666667",
      262=>"1.2",
      263=>"1.5",
      264=>"1.75",
      265=>"0.125",
      269=>"0.175",
      270=>"0.225",
      271=>"0.325",
      275=>"1.066666667",
      276=>"1.363636364",
      277=>"1.7",
      280=>"4.166666667",
      281=>"4.166666667",
      290=>"0.222222222",
      291=>"0.222222222",
      300=>"0.2",
      301=>"0.2",
      302=>"0.066666667",
      303=>"0.066666667",
      310=>"0.088888889",
      311=>"0.088888889",
      312=>"0.088888889",
      313=>"0.088888889",
      512=>"4.25",
      514=>"17",
      515=>"5",
      516=>"0.066666667",
      518=>"1.4",
      519=>"1.75",
      520=>"2.25",
      521=>"0.15",
      522=>"0.2",
      523=>"0.275",
      524=>"0.375",
      525=>"1.285714286",
      526=>"1.666666667",
      527=>"2.083333333",
      530=>"4.8",
      600=>"1.888888889",
      601=>"3.714285714",
      602=>"1.888888889",
      603=>"3.714285714",
      610=>"2.272727273",
      611=>"4.6",
      612=>"2.272727273",
      613=>"4.5",
      620=>"4.4",
      621=>"9",
      622=>"3.666666667",
      623=>"7.333333333",
      700=>"2.285714286",
      710=>"2",
      701=>"1.2",
      711=>"1",
      702=>"1.2",
      712=>"1"
    }
    #puts "Hello"
    #puts formatnumber
    return @lookup.fetch(formatnumber).to_f
  end
 
  def AudioFormats(framerate)
    @NTSCformats = {
      24=>"Legacy 8 Audio 4 channel 30 fps",
      68=>"Legacy 9 Audio 4 channel 30 fps",
      265=>"Audio 4 channel 16bit 30 fps",
      269=>"Audio 4 channel 24bit 30 fps",
      270=>"Audio 8 channel 16bit 30 fps",
      271=>"Audio 8 channel 24bit 30 fps"
    }
    @PALformats = {
      33=>"Legacy 8 Audio 4 channel 25 fps",
      73=>"Legacy 9 Audio 4 channel 25 fps",
      521=>"Audio 4 channel 16bit 25 fps",
      522=>"Audio 4 channel 24bit 25 fps",
      523=>"Audio 8 channel 16bit 25 fps",
      524=>"Audio 8 channel 24bit 25 fps"
    }
 
    if (Conf.framerate == 25)
      choicelist=@PALformats
    elsif (Conf.framerate == 30)
      choicelist=@NTSCformats
    end
    Conf.audioformat=choicelist.values[1]
    Conf.audionumber=choicelist.keys[1]
    list_box :items => choicelist.values, :choose => choicelist.values[1] do |list|
      Conf.audioformat=list.text
      Conf.audionumber=choicelist.key(list.text)
    end
 
  end
 
  def VideoFormats(framerate, vidtype)
    @SDNTSCformats = {
      17=>"Legacy 8 Mpeg 30 480i30",
      #      18=>"Legacy 8 Mpeg 40 480i30",
      #      19=>"Legacy 8 Mpeg 50 480i30",
      65=>"Legacy 9 Mpeg 30 480i30",
      66=>"Legacy 9 Mpeg 40 480i30",
      67=>"Legacy 9 Mpeg 50 480i30",
      86=>"Legacy 9E Mpeg 30 480i30",
      87=>"Legacy 9E Mpeg 40 480i30",
      88=>"Legacy 9E Mpeg 50 480i30",
      #   262=>"Mpeg 30 480i30",
      #   263=>"Mpeg 40 480i30",
      #  264=>"Mpeg 50 480i30",
      #  275=>"Mpeg 30 480i30 15f",
      #  276=>"Mpeg 40 480i30 11f",
      #  277=>"Mpeg 50 480i30 10f",
      710=>"DVCPRO50 525i30 8f",
      711=>"DVCPRO25 525i30 10f",
      712=>"DV 525i30 10f"
    }
    @HDNTSCformats = {
      #      20=>"Legacy 8 DV100 720p60",
      #      23=>"Legacy 8 DV100 1080i30",
      78=>"Legacy 9 DV100 720p60",
      81=>"Legacy 9 DV100 1080i30",
      256=>"DV100 720p60",
      259=>"DV100 1080i30",
      280=>"DV100 720p60 6f",
      281=>"DV100 1080i30 6f",
      600=>"AVC-I 50 1080i30 9f",
      601=>"AVC-I 100 1080i30 7f",
      602=>"AVC-I 50 720p60 9f",
      603=>"AVC-I 100 720p60 7f",
      622=>"AVC-I 100 1080p60 6f",
      623=>"AVC-I 200 1080p60 3f"
    }
    @SDPALformats = {
      26=>"Legacy 8 Mpeg 30 576i25",
      #      27=>"Legacy 8 Mpeg 40 576i25",
      #      28=>"Legacy 8 Mpeg 50 576i25",
      70=>"Legacy 9 Mpeg 30 576i25",
      71=>"Legacy 9 Mpeg 40 576i25",
      72=>"Legacy 9 Mpeg 50 576i25",
      89=>"Legacy 9E Mpeg 30 576i25",
      90=>"Legacy 9E Mpeg 40 576i25",
      91=>"Legacy 9E Mpeg 50 576i25",
      #   518=>"Mpeg 30 576i25",
      #   519=>"Mpeg 40 576i25",
      #   520=>"Mpeg 50 576i25",
      #   525=>"Mpeg 30 576i25 14f",
      #   526=>"Mpeg 40 576i25 12f",
      #   527=>"Mpeg 50 576i25 12f",
      700=>"DVCPRO50 625i25  7f",
      701=>"DVCPRO25 625i25 10f",
      702=>"DV 625i25 10f"
    }
    @HDPALformats = {
      512=>"DV100 720p50",
      515=>"DV100 1080i25",
      530=>"DV100 1080i25 5f",
      610=>"AVC-I 50 1080i25 11f",
      611=>"AVC-I 100 1080i25 5f",
      612=>"AVC-I 50 720p50 11f",
      613=>"AVC-I 100 720p50 6f",
      620=>"AVC-I 100 1080p50 5f",
      621=>"AVC-I 200 1080p50 3f"
    }
 
    if (Conf.framerate == 25 &&  Conf.vidtype == "HD")
      choicelist = @HDPALformats
    elsif (Conf.framerate == 25 && Conf.vidtype == "SD")
      choicelist = @SDPALformats
    elsif (Conf.framerate == 30 && Conf.vidtype == "HD")
      choicelist = @HDNTSCformats
    elsif (Conf.framerate == 30 &&  Conf.vidtype == "SD")
      choicelist = @SDNTSCformats
    end
    Conf.videoformat=choicelist.values[1]
    Conf.videonumber=choicelist.keys[1]
    list_box :items => choicelist.values, :choose => choicelist.values[1] do |list|
      Conf.videoformat=list.text
      Conf.videonumber=choicelist.key(list.text)
    end
 
  end
 
  def BrowseFormats(framerate)
    @BNTSCformats = {
      #      37=>"Legacy 8 Browse Video 30 fps",
      77=>"Legacy 9 Browse Video 30 fps",
      260=>"Browse Video 30 fps"
      #   291=>"MPEG-2 Browse Video 30 fps",
      #   301=>"H.264 Browse Video 30 fps",
      #   303=>"H.264 SIF Browse Video 30 fps",
      #    311=>"H.264 640x360 30 fps",
      #    313=>"H.264 640x480 30 fps"
    }
    @BPALformats = {
      #      34=>"Legacy 8 Browse Video 25 fps",
      74=>"Legacy 9 Browse Video 25 fps",
      #    290=>"MPEG-2 Browse Video 25 fps",
      #    300=>"H.264 Browse Video 25 fps",
      #   302=>"H.264 SIF Browse Video 25 fps",
      #    310=>"H.264 640x360 25 fps",
      #   312=>"H.264 640x480 25 fps",
      516=>"Browse Video 25 fps"
    }
 
    if (Conf.framerate == 25)
      choicelist=@BPALformats
    elsif (Conf.framerate == 30)
      choicelist=@BNTSCformats
    end
    Conf.browseformat=choicelist.values[1]
    Conf.browsenumber=choicelist.keys[1]
    list_box :items => choicelist.values, :choose => choicelist.values[1] do |list|
      Conf.browseformat=list.text
      Conf.browsenumber=choicelist.key(list.text)
    end
 
  end
 
  def configure
    Conf.new
    Conf.framerate=25
    Conf.vidtype="SD"
    background rgb(50,50,125)
    #style Shoes::Para, stroke: white, size: 'xx-small'
    # green shoes - x-small is small enough   style Shoes::Para, :stroke=> white, :size=> 'x-small'
    style Shoes::Para, :stroke=> white, :size=> 'xx-small'
    stack do
      para "Enter Hostname:"
      edit_line("localhost") do |e|
        Conf.hostname = e.text
      end
 
      para "Choose an frame rate:"
      list_box :items => [25, 30],:choose=>Conf.framerate do |list|
        Conf.framerate =  list.text.to_i
      end
      para "Choose SD or HD formats"
      list_box :items => ["SD", "HD"],:choose=>Conf.vidtype do |list|
        Conf.vidtype = list.text
      end
    end
 
    button "Confirm Settings" do
      visit "/settings"
    end
  end
 
  def check_settings
    background rgb(50,50,125)
    #style Shoes::Para, stroke: white, size: 'xx-small'
    # green shoes - x-small is small enough   style Shoes::Para, :stroke=> white, :size=> 'x-small'
    style Shoes::Para, :stroke=> white, :size=> 'xx-small'
    stack do
      para "Choose an Video format:"
      VideoFormats(Conf.framerate, Conf.vidtype)
 
      para "Choose an Audio format:"
      AudioFormats(Conf.framerate)
 
      para "Choose Browse format:"
      BrowseFormats(Conf.framerate)
 
      button "Update Settings" do
        visit "/update"
      end
    end
  end
 
  def update_capacity
    background rgb(50,50,125)
    #style Shoes::Para, stroke: white, size: 'xx-small'
    # green shoes - x-small is small enough   style Shoes::Para, :stroke=> white, :size=> 'x-small'
    style Shoes::Para, :stroke=> white, :size=> '8'
    output
    #every(10) {
      #output.new
    #}
    timer(3){visit '/update'}
  end
 
  def calchours(protons)
    #DEBUG... print the format numbers and names
    #        puts Conf.videonumber
    #        puts Conf.audionumber
    #        puts Conf.browsenumber
    #        puts Conf.audioformat
    #        puts Conf.videoformat
    #        puts Conf.browseformat
    rate = (protons.to_i / (LookupRatio(Conf.videonumber)+LookupRatio(Conf.audionumber)+LookupRatio(Conf.browsenumber))/Conf.framerate.to_i/60/60).round(2)
    #SANITY CHECK PROTONS AS HOURS
    #puts rate
    return rate
  end
 
  def getValues
    #Manager.open(:host => Conf.hostname) do |manager|
      #puts Conf.hostname
      poolArray = []
      #poolsTable = ObjectId.new("1.3.6.1.4.1.15248.2.5.1.3.1")
      #manager.walk(poolsTable) do |row|
        #poolArray.push(row.to_s)
      #end
      if poolArray.empty?
        #puts "Manager Down"
        poolArray = [
          '[name=1.3.6.1.4.1.15248.2.5.1.3.1.1.8650, value=8650 (INTEGER)]',
          '[name=1.3.6.1.4.1.15248.2.5.1.3.1.1.8651, value=8651 (INTEGER)]',
          '[name=1.3.6.1.4.1.15248.2.5.1.3.1.2.8650, value=QNewsAK (OCTET STRING)]',
          '[name=1.3.6.1.4.1.15248.2.5.1.3.1.2.8651, value=QSuite4AK (OCTET STRING)]',
          '[name=1.3.6.1.4.1.15248.2.5.1.3.1.3.8650, value=46835255 (INTEGER)]',
          '[name=1.3.6.1.4.1.15248.2.5.1.3.1.3.8651, value=11041721 (INTEGER)]',
          '[name=1.3.6.1.4.1.15248.2.5.1.3.1.4.8650, value=8442357 (INTEGER)]',
          '[name=1.3.6.1.4.1.15248.2.5.1.3.1.4.8651, value=5717570 (INTEGER)]',
          '[name=1.3.6.1.4.1.15248.2.5.1.3.1.5.8650, value=0 (INTEGER)]',
          '[name=1.3.6.1.4.1.15248.2.5.1.3.1.5.8651, value=0 (INTEGER)]',
        ]
        #debug when running as console app
        #else puts "Manager Up"
      end
      groups = poolArray.group_by{ |s| s.split(',').first[/\d+$/] }
      values = groups.map{ |key, ary| ary.map{ |s| s[/value=(\S+)/, 1].to_s } }
      #Dump values to check syntax
      #  puts "Values: #{@values}"
      return values
    #end
  end
 
  def output
    time = Time.now
    stack :margin=>1, :width=>440  do
      #clear do
      border blue..white, :strokewidth => 1
      para time.strftime("%a %b %d, %Y %I:%M.%S")
      getValues.each {|v|
        flow :width=>'100%', :margin=>2 do
          border white..lightblue, :strokewidth => 2
          para "#{v[1]} (Pool: #{v[0]})"
          stack :width=>'33%' do
            para "Free Hours"
            para "#{calchours(v[3])}"
          end
          stack :width=>'33%' do
            para "Used Hours:"
            para "#{calchours(v[2])}"
          end
          stack :width=>'33%' do
            para "Percent Free: "
            para "#{(v[3].to_f/v[2].to_f*100).round(2)}%\r\n"
          end
        end
      }
    end
    #end
 
 
  end
#end
#  def para(text='')
#    super text, :family=> "Calibri", :stroke=> white, :size=>'small'
#  end
end
 
  Shoes.app(:title=> "Quantel SNMP Space Monitor",
  :width=> 450,
  :height=> 300)