# The player in the world
class Player
  # Initialize the player
  #
  # @param api [MinecraftApi] API to use
  def initialize(api)
    @api = api
  end

  # Teleport the player to a specific location
  #
  # @param x [Double] x coordinate
  # @param y [Double] y coordinate
  # @param z [Double] z coordinate
  def go(x,y,z)
    @api.send("player.setTile(#{x},#{y},#{z})")
  end

  # Get player location
  #
  # @return [Array] coordinates where the player is
  def location
    response = @api.send_and_receive("player.getTile()")
    response.split(',').map { |s| s.to_i }
  end    
end
