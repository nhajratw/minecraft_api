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

  def set_block(x,y,z,block_type)
    send("world.setBlock(#{x},#{y},#{z},#{block_type.id})")
  end

  def set_blocks(x1,y1,z1,x2,y2,z2,block_type)
    send("world.setBlocks(#{x1},#{y1},#{z1},#{x2},#{y2},#{z2},#{block_type.id})")
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

  def camera_mode(mode,x=nil,y=nil,z=nil)
    case mode
    when :normal then send("camera.mode.setNormal()")
    when :third_person then send("camera.mode.setThirdPerson()")
    when :fixed then send("camera.mode.setFixed()")
    when :position then send("camera.mode.setPos(#{x},#{y},#{z})")
    else raise RuntimeError.new("valid camera settings are: :normal, :third_person, :fixed, and :position")
    end
  end

  def player_set_tile(x,y,z)
    send("player.setTile(#{x},#{y},#{z})")
  end

  def player_get_tile
    response = send_and_receive("player.getTile()")
    response.split(',').map { |s| s.to_i }
  end    

  def close
    @socket.close
  end
end
