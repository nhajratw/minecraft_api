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
  def get_block(x,y,z)
    response = @api.send_and_receive("world.getBlock(#{x},#{y},#{z})")
    Block.find(response.to_i) 
  end

  # Get the block at specific coordinates with data
  #
  # @param x [Double] x coordinate
  # @param y [Double] y coordinate
  # @param z [Double] z coordinate
  def get_block_with_data(x,y,z)
    response = @api.send_and_receive("world.getBlcoWithData(#{x},#{y},#{z})")
    response.split(',').map { |s| Block.find(s.to_i) }
  end

  # Set a block at a specific location
  #
  # @param x [Double] x coordinate
  # @param y [Double] y coordinate
  # @param z [Double] z coordinate
  # @param block [Block] block to place
  def set_block(x,y,z,block)
    @api.send("world.setBlock(#{x},#{y},#{z},#{block.as_parameter_list})")
  end

  # Get the blocks at specific coordinates
  #
  # @param x0 [Double] x0 coordinate
  # @param y0 [Double] y0 coordinate
  # @param z0 [Double] z0 coordinate
  # @param x1 [Double] x1 coordinate
  # @param y1 [Double] y1 coordinate
  # @param z1 [Double] z1 coordinate
  def get_blocks(x0,y0,z0,x1,y1,z1)
    response = @api.send_and_receive("world.getBlocks(#{x0},#{y0},#{z0},#{x1},#{y1},#{z1})")
    Block.find(response.to_i) 
  end

  # Set the blocks at a specific location
  #
  # @param x0 [Double] x0 coordinate
  # @param y0 [Double] y0 coordinate
  # @param z0 [Double] z0 coordinate
  # @param x1 [Double] x1 coordinate
  # @param y1 [Double] y1 coordinate
  # @param z1 [Double] z1 coordinate
  # @param block [Block] block to place
  def set_blocks(x0,y0,z0,x1,y1,z1,block)
    @api.send("world.setBlocks(#{x0},#{y0},#{z0},#{x1},#{y1},#{z1},#{block.as_parameter_list})")
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
  def get_height(x,z)
    @api.send_and_receive("world.getHeight(#{x},#{z})").to_i
  end

  def get_player_entity_id(name) do
    @api.send_and_receive("world.getPlayerId(name)").to_i
  end

  def get_player_entity_ids() do
    response = @api.send_and_receive("world.getPlayerIds()")
    response.split(',').map { |s| s.to_i }
  end

  def setting(setting, status) do
    @api.send("world.setting(#{setting},#{!!status})")
  end

  # Save the world checkpoint
  def save_checkpoint
    @api.send("world.checkpoint.save()")
  end

  # Restore world the checkpoint
  def restore_checkpoint
    @api.send("world.checkpoint.restore()")
  end
end
