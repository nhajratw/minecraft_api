require_relative 'block_type'

class World
  def initialize(api)
    @api = api
  end

  def block_at(x,y,z)
    response = @api.send_and_receive("world.getBlock(#{x},#{y},#{z})")
    BlockType.find(response.to_i) 
  end

  def block(x,y,z,block_type)
    @api.send("world.setBlock(#{x},#{y},#{z},#{block_type.id})")
  end

  def cube(x1,y1,z1,x2,y2,z2,block_type)
    @api.send("world.setBlocks(#{x1},#{y1},#{z1},#{x2},#{y2},#{z2},#{block_type.id})")
  end

  def height(x,z)
    @api.send_and_receive("world.getHeight(#{x},#{z})").to_i
  end

  def save
    @api.send("word.checkpoint.save()")
  end

  def restore
    @api.send("word.checkpoint.restore()")
  end

  def chat_post(message)
    @api.send("chat.post(#{message})")
  end
end
