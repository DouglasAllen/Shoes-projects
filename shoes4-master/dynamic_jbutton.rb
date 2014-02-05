require 'java'

java_import ['javax.swing.JFrame',
             'javax.swing.JLabel',
             'javax.swing.JButton',
             'javax.swing.JPanel']


lll = JButton.new("button1")
puts "value of button " + lll.to_s
jPanelTest = JPanel.new
jPanelTest.add(lll)
jPanelTest.revalidate()
#~ JFrame frame = new JFrame("The JFrame")
frame = JFrame.new("The JFrame")
frame.add(jPanelTest)
frame.pack
frame.show