require_relative 'block'

# The Minecraft world
class World
  # Initialize the world
  #
  # @param api [MinecraftApi] API to use
  def initialize(api)
    @api = api
  end

  # Get the block at specific coordinates
  #
  # @param x [Double] x coordinate
  # @param y [Double] y coordinate
  # @param z [Double] z coordinate
  def block_at(x,y,z)
    response = @api.send_and_receive("world.getBlock(#{x},#{y},#{z})")
    Block.find(response.to_i) 
  end

  # Set a block at a specific location
  #
  # @param x [Double] x coordinate
  # @param y [Double] y coordinate
  # @param z [Double] z coordinate
  # @param block [Block] block to place
  def block(x,y,z,block)
    @api.send("world.setBlock(#{x},#{y},#{z},#{block.as_parameter_list})")
  end

  # Fill an entire cube with a block
  #
  # @param x1 [Double] first x coordinate
  # @param y1 [Double] first y coordinate
  # @param z1 [Double] first z coordinate
  # @param x2 [Double] second x coordinate
  # @param y2 [Double] second y coordinate
  # @param z2 [Double] second z coordinate
  # @param block [Block] block to use
  def cube(x1,y1,z1,x2,y2,z2,block)
    @api.send("world.setBlocks(#{x1},#{y1},#{z1},#{x2},#{y2},#{z2},#{block.as_parameter_list})")
  end

  # Get pile height
  #
  # @param x [Double] x coordinate
  # @param z [Double] z coordinate
  # @return height
  def height(x,z)
    @api.send_and_receive("world.getHeight(#{x},#{z})").to_i
  end

  # Save the world checkpoint
  def save
    @api.send("world.checkpoint.save()")
  end

  # Restore world the checkpoint
  def restore
    @api.send("world.checkpoint.restore()")
  end
end
