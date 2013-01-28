require 'minecraft_api'

describe "Minecraft server" do

  before(:each) do
    @mcapi = MinecraftApi.new
    @mcapi.connect
  end

  after(:each) do
    @mcapi.close
  end

  it "returns a 'Fail' when a bad command is sent" do
    response = @mcapi.send_and_receive 'junk'
    response.should eq('Fail')
  end

  it "can create a block" do
    @mcapi.setBlock(0,0,0, Block::WOOD)
    block = @mcapi.getBlock(0,0,0)
    block.should eq(Block::WOOD)
  end

  it "can create a block of a different type" do
    @mcapi.setBlock(0,0,0, Block::SAND)
    block = @mcapi.getBlock(0,0,0)
    block.should eq(Block::SAND)
  end
end
