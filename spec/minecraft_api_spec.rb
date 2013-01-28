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
    @mcapi.set_block(0,0,0,BlockType::WOOD)
    block_type = @mcapi.get_block_type(0,0,0)
    block_type.should eq(BlockType::WOOD)
  end

  it "can create a block of a different type" do
    @mcapi.set_block(0,0,0, BlockType::SAND)
    block_type = @mcapi.get_block_type(0,0,0)
    block_type.should eq(BlockType::SAND)
  end

  it "can get the height of the world" do
    y = @mcapi.get_height(5,5)
    y.should eq(2)
  end

  it "can checkpoint save" do
    @mcapi.checkpoint_save
  end

  it "can checkpoint restore" do
    @mcapi.checkpoint_restore
  end

  it "can send chats" do
    @mcapi.chat_post("hello")
  end
end
