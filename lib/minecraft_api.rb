require 'socket'
require 'io/wait'

class MinecraftApi

  def connect
    @socket = TCPSocket.new '10.0.1.129', 4711
  end

  def send(data)
    puts "Sending #{data}"
    @socket.puts "#{data}"
  end

  def send_and_receive(data)
    send(data)
    @socket.gets.chomp
  end

  def getBlock(x,y,z)
    response = send_and_receive("world.getBlock(#{x},#{y},#{z})")
    Block.find(response.to_i) 
  end

  def setBlock(x,y,z,block)
    send("world.setBlock(#{x},#{y},#{z},#{block.id})")
  end

  def close
    @socket.close
  end
end
