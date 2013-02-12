require 'socket'
require 'io/wait'

require 'world'

class MinecraftApi

  attr_reader :world

  def initialize(host = 'localhost', port = 4711)
    @socket = TCPSocket.new host, port
    @world = World.new(self)
  end

  # The other api's have a method like this
  # I haven't seen it be invoked yet. Perhaps it is not needed
  def drain()
    while @socket.ready?
      puts "DRAINING DATA FROM SOCKET [#{@socket.gets}]"
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
