require 'socket'
require 'io/wait'

require 'world'
require 'camera'

class MinecraftApi

  attr_reader :world
  attr_reader :camera

  def initialize(host = 'localhost', port = 4711)
    @socket = TCPSocket.new host, port
    @world = World.new(self)
    @camera = Camera.new(self)
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
