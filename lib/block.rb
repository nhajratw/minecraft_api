class Block

  MATERIALS = {
    0  => :air,
    12 => :sand
  }

  def initialize(id)
    @id = id
  end

  def material
    MATERIALS[@id]
  end
end
