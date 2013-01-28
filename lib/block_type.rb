class BlockType

  @@all_block_types = {}

  attr_reader :id

  def initialize(id)
    @id = id
    @@all_block_types[id] = self
  end

  def self.find(id)
    @@all_block_types[id]
  end

  AIR                 = BlockType.new(0)
  STONE               = BlockType.new(1)
  GRASS               = BlockType.new(2)
  DIRT                = BlockType.new(3)
  COBBLESTONE         = BlockType.new(4)
  WOOD_PLANKS         = BlockType.new(5)
  SAPLING             = BlockType.new(6)
  BEDROCK             = BlockType.new(7)
  WATER_FLOWING       = BlockType.new(8)
  WATER_STATIONARY    = BlockType.new(9)
  LAVA_FLOWING        = BlockType.new(10)
  LAVA_STATIONARY     = BlockType.new(11)
  SAND                = BlockType.new(12)
  GRAVEL              = BlockType.new(13)
  GOLD_ORE            = BlockType.new(14)
  IRON_ORE            = BlockType.new(15)
  COAL_ORE            = BlockType.new(16)
  WOOD                = BlockType.new(17)
  LEAVES              = BlockType.new(18)
  GLASS               = BlockType.new(20)
  LAPIS_LAZULI_ORE    = BlockType.new(21)
  LAPIS_LAZULI_BLOCK  = BlockType.new(22)
  SANDSTONE           = BlockType.new(24)
  BED                 = BlockType.new(26)
  COBWEB              = BlockType.new(30)
  GRASS_TALL          = BlockType.new(31)
  WOOL                = BlockType.new(35)
  FLOWER_YELLOW       = BlockType.new(37)
  FLOWER_CYAN         = BlockType.new(38)
  MUSHROOM_BROWN      = BlockType.new(39)
  MUSHROOM_RED        = BlockType.new(40)
  GOLD_BLOCK          = BlockType.new(41)
  IRON_BLOCK          = BlockType.new(42)
  STONE_SLAB_DOUBLE   = BlockType.new(43)
  STONE_SLAB          = BlockType.new(44)
  BRICK_BLOCK         = BlockType.new(45)
  TNT                 = BlockType.new(46)
  BOOKSHELF           = BlockType.new(47)
  MOSS_STONE          = BlockType.new(48)
  OBSIDIAN            = BlockType.new(49)
  TORCH               = BlockType.new(50)
  FIRE                = BlockType.new(51)
  STAIRS_WOOD         = BlockType.new(53)
  CHEST               = BlockType.new(54)
  DIAMOND_ORE         = BlockType.new(56)
  DIAMOND_BLOCK       = BlockType.new(57)
  CRAFTING_TABLE      = BlockType.new(58)
  FARMLAND            = BlockType.new(60)
  FURNACE_INACTIVE    = BlockType.new(61)
  FURNACE_ACTIVE      = BlockType.new(62)
  DOOR_WOOD           = BlockType.new(64)
  LADDER              = BlockType.new(65)
  STAIRS_COBBLESTONE  = BlockType.new(67)
  DOOR_IRON           = BlockType.new(71)
  REDSTONE_ORE        = BlockType.new(73)
  SNOW                = BlockType.new(78)
  ICE                 = BlockType.new(79)
  SNOW_BLOCK          = BlockType.new(80)
  CACTUS              = BlockType.new(81)
  CLAY                = BlockType.new(82)
  SUGAR_CANE          = BlockType.new(83)
  FENCE               = BlockType.new(85)
  GLOWSTONE_BLOCK     = BlockType.new(89)
  BEDROCK_INVISIBLE   = BlockType.new(95)
  STONE_BRICK         = BlockType.new(98)
  GLASS_PANE          = BlockType.new(102)
  MELON               = BlockType.new(103)
  FENCE_GATE          = BlockType.new(107)
  GLOWING_OBSIDIAN    = BlockType.new(246)
  NETHER_REACTOR_CORE = BlockType.new(247)

  def ==(another_block_type)
    @id == another_block_type.id
  end

end
