class Block

  @@all_blocks = {}

  attr_reader :id

  def initialize(id)
    @id = id
    @@all_blocks[id] = self
  end

  AIR                 = Block.new(0)
  STONE               = Block.new(1)
  GRASS               = Block.new(2)
  DIRT                = Block.new(3)
  COBBLESTONE         = Block.new(4)
  WOOD_PLANKS         = Block.new(5)
  SAPLING             = Block.new(6)
  BEDROCK             = Block.new(7)
  WATER_FLOWING       = Block.new(8)
  WATER_STATIONARY    = Block.new(9)
  LAVA_FLOWING        = Block.new(10)
  LAVA_STATIONARY     = Block.new(11)
  SAND                = Block.new(12)
  GRAVEL              = Block.new(13)
  GOLD_ORE            = Block.new(14)
  IRON_ORE            = Block.new(15)
  COAL_ORE            = Block.new(16)
  WOOD                = Block.new(17)
  LEAVES              = Block.new(18)
  GLASS               = Block.new(20)
  LAPIS_LAZULI_ORE    = Block.new(21)
  LAPIS_LAZULI_BLOCK  = Block.new(22)
  SANDSTONE           = Block.new(24)
  BED                 = Block.new(26)
  COBWEB              = Block.new(30)
  GRASS_TALL          = Block.new(31)
  WOOL                = Block.new(35)
  FLOWER_YELLOW       = Block.new(37)
  FLOWER_CYAN         = Block.new(38)
  MUSHROOM_BROWN      = Block.new(39)
  MUSHROOM_RED        = Block.new(40)
  GOLD_BLOCK          = Block.new(41)
  IRON_BLOCK          = Block.new(42)
  STONE_SLAB_DOUBLE   = Block.new(43)
  STONE_SLAB          = Block.new(44)
  BRICK_BLOCK         = Block.new(45)
  TNT                 = Block.new(46)
  BOOKSHELF           = Block.new(47)
  MOSS_STONE          = Block.new(48)
  OBSIDIAN            = Block.new(49)
  TORCH               = Block.new(50)
  FIRE                = Block.new(51)
  STAIRS_WOOD         = Block.new(53)
  CHEST               = Block.new(54)
  DIAMOND_ORE         = Block.new(56)
  DIAMOND_BLOCK       = Block.new(57)
  CRAFTING_TABLE      = Block.new(58)
  FARMLAND            = Block.new(60)
  FURNACE_INACTIVE    = Block.new(61)
  FURNACE_ACTIVE      = Block.new(62)
  DOOR_WOOD           = Block.new(64)
  LADDER              = Block.new(65)
  STAIRS_COBBLESTONE  = Block.new(67)
  DOOR_IRON           = Block.new(71)
  REDSTONE_ORE        = Block.new(73)
  SNOW                = Block.new(78)
  ICE                 = Block.new(79)
  SNOW_BLOCK          = Block.new(80)
  CACTUS              = Block.new(81)
  CLAY                = Block.new(82)
  SUGAR_CANE          = Block.new(83)
  FENCE               = Block.new(85)
  GLOWSTONE_BLOCK     = Block.new(89)
  BEDROCK_INVISIBLE   = Block.new(95)
  STONE_BRICK         = Block.new(98)
  GLASS_PANE          = Block.new(102)
  MELON               = Block.new(103)
  FENCE_GATE          = Block.new(107)
  GLOWING_OBSIDIAN    = Block.new(246)
  NETHER_REACTOR_CORE = Block.new(247)

  def as_parameter_list
    @id
  end

  def self.find(id)
    @@all_blocks[id]
  end

  def ==(another_block)
    @id == another_block.id
  end

end
