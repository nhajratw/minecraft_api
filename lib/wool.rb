require_relative 'block'
require_relative 'color'

class Wool < Block
  attr_reader :color

  def initialize(color)
    super(BlockType::WOOL)
    @color = color
  end
end
