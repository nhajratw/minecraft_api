require 'socket'

class MinecraftApi
  def self.connect
    
    puts "Opening socket"
    socket = TCPSocket.new '10.0.1.129', 4711
    puts "Socket opened"
    socket.close

    puts "Socket closed"
  end
end
