require 'socket'
require 'io/wait'

require_relative 'world'
require_relative 'camera'
require_relative 'player'
require_relative 'chat'

# The Minecraft API, the core of the library
class MinecraftApi

  attr_reader :world
  attr_reader :camera
  attr_reader :player
  attr_reader :chat

  # Initialize the API
  #
  # @param host [String, nil] host to connect to
  # @param port [Integer, nil] port to use
  def initialize(host = 'localhost', port = 4711)
    @socket = TCPSocket.new host, port
    @world = World.new(self)
    @camera = Camera.new(self)
    @player = Player.new(self)
    @chat = Chat.new(self)
  end

  # Drain socket extra data
  def drain()
    if @socket.ready?
      $stderr.puts "Draining extra data found in socket => [#{@socket.gets.chomp}]"
    end
  end

  # Send data to the game
  #
  # @param data [String] data to send
  def send(data)
    drain()
    @socket.puts "#{data}"
  end

  # Send data to the game and receive a response
  #
  # @param data [String] data to send
  # @return data from the game
  def send_and_receive(data)
    send(data)
    @socket.gets.chomp
  end

  # Close the connection
  def close
    @socket.close
  end
end
