require 'socket'
require 'io/wait'

class MinecraftApi

  def initialize(host = 'localhost', port = 4711)
    @socket = TCPSocket.new host, port
  end

  # The other api's have a method like this
  # I haven't seen it be invoked yet. Perhaps it is not needed
  def drain()
    while @socket.ready?
      puts "**** READ A CHARACTER [#{@socket.gets}]"
    end
  end

  def send(data)
    drain()
    @socket.puts "#{data}"
  end

  def send_and_receive(data)
    send(data)
    @socket.gets.chomp
  end

  def get_block_type(x,y,z)
    response = send_and_receive("world.getBlock(#{x},#{y},#{z})")
    BlockType.find(response.to_i) 
  end

  def set_block(x,y,z,block)
    send("world.setBlock(#{x},#{y},#{z},#{block.id})")
  end

  def get_height(x,z)
    send_and_receive("world.getHeight(#{x},#{z})").to_i
  end

  def checkpoint_save
    send("word.checkpoint.save()")
  end

  def checkpoint_restore
    send("word.checkpoint.restore()")
  end

  def chat_post(message)
    send("chat.post(#{message})")
  end

  def close
    @socket.close
  end
end
