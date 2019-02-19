require_relative 'block'
require_relative 'color'

# Wool block object
class Wool < Block
  WOOL_BLOCK_ID = 35
  private_constant :WOOL_BLOCK_ID

  # @return [Color] wool color
  attr_reader :color

  # Initialize the wool
  #
  # @param color [Color] wool color
  def initialize(color)
    super(WOOL_BLOCK_ID)
    @color = color
  end

  # @return [String] block identifier and wool color
  def as_parameter_list
    "#{@id},#{@color}"
  end

  # Test if two wools are the same (colors & identifiers)
  #
  # @param another_block [Wool] wool to compare to
  def ==(another_wool)
    @id == another_wool.id && @color == another_wool.color
  end

end
