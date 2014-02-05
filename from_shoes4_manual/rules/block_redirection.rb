class Messenger1
  def initialize(stack)
    @stack = stack
  end
  
  def add(msg)
    @stack.append do
      para msg
    end
  end
end

class Messenger2
  def initialize(stack)
    @stack = stack
  end
  
  def add(msg)
    @stack.app do
      append do
        para msg
      end
    end
  end
end

Shoes.app do    
   
  stack do    
    
    para "First"
    para "Second"
    para "Third"
    msg2 = Messenger2.new(self)
    msg2.add "message 2"
    
  end  
  
  # won't display
  stack do

    para "First"
    para "Second"
    para "Third"
    msg1 = Messenger1.new(self)
    msg1.add "message 1"
    
  end   

  
  
end

