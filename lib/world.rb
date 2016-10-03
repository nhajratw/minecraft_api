require_relative 'block'

class World
  def initialize(api)
    @api = api
  end

  def block_at(x,y,z)
    response = @api.send_and_receive("world.getBlock(#{x},#{y},#{z})")
    Block.find(response.to_i) 
  end

  def block(x,y,z,block)
    @api.send("world.setBlock(#{x},#{y},#{z},#{block.as_parameter_list})")
  end

  def cube(x1,y1,z1,x2,y2,z2,block,color)
    @api.send("world.setBlocks(#{x1},#{y1},#{z1},#{x2},#{y2},#{z2},#{block.as_parameter_list},#{color})")
  end

  def height(x,z)
    @api.send_and_receive("world.getHeight(#{x},#{z})").to_i
  end

  def save
    @api.send("world.checkpoint.save()")
  end

  def restore
    @api.send("world.checkpoint.restore()")
  end

  def chat_post(message)
    @api.send("chat.post(#{message})")
  end
end
