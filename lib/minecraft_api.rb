require 'socket'

class MinecraftApi

  def connect
    puts "Opening socket"
    @socket = TCPSocket.new '10.0.1.129', 4711
    puts "Socket opened"
  end

  def send(data)
    puts "Sending #{data}"
    @socket.sendmsg "#{data}\n", 0
    puts "Reading from socket"
    @socket.recvmsg[0].chomp
  end

  def close
    @socket.close
    puts "Socket closed"
  end
end
