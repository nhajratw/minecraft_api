require 'socket'
require 'io/wait'

require_relative 'world'
require_relative 'camera'
require_relative 'player'

class MinecraftApi

  attr_reader :world
  attr_reader :camera
  attr_reader :player

  def initialize(host = 'localhost', port = 4711)
    @socket = TCPSocket.new host, port
    @world = World.new(self)
    @camera = Camera.new(self)
    @player = Player.new(self)
  end

  def drain()
    if @socket.ready?
      $stderr.puts "Draining extra data found in socket => [#{@socket.gets.chomp}]"
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

  def close
    @socket.close
  end
end
