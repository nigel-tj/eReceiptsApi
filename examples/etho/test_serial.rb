#simplest ruby program to read from arduino serial, 
#using the SerialPort gem
#(http://rubygems.org/gems/serialport)

require "serialport"
require "dino"

#params for serial port
port_str = "/dev/ttyACM0"  #may be different for you
baud_rate = 115200
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE



#just read forever

#while true do
  counter = 1
  file = File.new("/home/nigel/work/ss4/e_receipts_api/examples/etho/test.txt", "r")
  while (line = file.gets)
    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)    
    sp.write "#{line}"  
    puts "#{counter}: #{line} "
    counter = counter + 1
    
  end
  file.close
  # message = sp.gets
  # if message
  #   message.chomp!

  #   puts message
  # end
#end
sp.close                       #see note 1

