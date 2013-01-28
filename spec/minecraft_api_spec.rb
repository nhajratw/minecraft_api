require 'minecraft_api'

describe "Minecraft server" do

  before(:each) do
    @mcapi = MinecraftApi.new('10.0.1.129', 4711)
  end

  after(:each) do
    @mcapi.close
  end

  it "returns a 'Fail' when a bad command is sent" do
    response = @mcapi.send_and_receive 'junk'
    response.should eq('Fail')
  end

  it "can create a block" do
    @mcapi.setBlock(0,0,0,BlockType::WOOD)
    block_type = @mcapi.getBlockType(0,0,0)
    block_type.should eq(BlockType::WOOD)
  end

  it "can create a block of a different type" do
    @mcapi.setBlock(0,0,0, BlockType::SAND)
    block_type = @mcapi.getBlockType(0,0,0)
    block_type.should eq(BlockType::SAND)
  end
end
