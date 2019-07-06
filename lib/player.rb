# The player in the world
class Player
  # Initialize the player
  #
  # @param api [MinecraftApi] API to use
  def initialize(api)
    @api = api
  end

  # Teleport the player to a specific tile
  #
  # @param x [Double] x coordinate
  # @param y [Double] y coordinate
  # @param z [Double] z coordinate
  def set_tile(x,y,z)
    @api.send("player.setTile(#{x},#{y},#{z})")
  end

  # Teleport the player to a specific location
  #
  # @param x [Double] x coordinate
  # @param y [Double] y coordinate
  # @param z [Double] z coordinate
  def set_position(x,y,z)
    @api.send("player.setPos(#{x},#{y},#{z})")
  end

  # Get player location
  #
  # @return [Array] coordinates where the player tile is
  def get_tile
    response = @api.send_and_receive("player.getTile()")
    response.split(',').map { |s| s.to_i }
  end    

  # Get player location
  #
  # @return [Array] coordinates where the player is
  def get_position
    response = @api.send_and_receive("player.getPos()")
    response.split(',').map { |s| s.to_i }
  end    

  # Get player direction
  #
  # @return [Array] direction (x,y,z) where the player is facing
  def get_direction
    response = @api.send_and_receive("player.getDirection()")
    response.split(',').map { |s| s.to_i }
  end    

  # Get player pitch
  #
  # @return Float pitch of the player
  def get_pitch
    @api.send_and_receive("player.getPitch()").to_f
  end

  # Get player rotation
  #
  # @return Float rotation of the player
  def get_rotation
    @api.send_and_receive("player.getRotation()").to_f
  end
end
