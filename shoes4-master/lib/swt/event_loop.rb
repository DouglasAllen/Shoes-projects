
module Swt
  class EventLoop
    def initialize
      @running = false
    end
    
    # Begins the SWT event loop. Blocks.
    def start
      @running = true
      @display = Swt.display
      while @running and not @display.disposed?
        begin
          unless read = @display.read_and_dispatch
            @display.sleep
          end
        rescue java.lang.Throwable => e
          puts "Error in Event Loop:"
          p e
          puts e.backtrace
        end
      end
      @display.dispose
    end
    
    # Lets the even loop run until block returns false
    def yield_until
      @display.read_and_dispatch until yield
    end
    
    # Halts the SWT event loop.
    def stop
      @running = false
    end
  end
end
