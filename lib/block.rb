require 'block_type'

class Block

  attr_reader :type

  def initialize(block_type)
    @type = block_type
  end

end

