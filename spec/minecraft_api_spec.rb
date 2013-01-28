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
    @mcapi.set_block(0,0,0,BlockType::SAND)
    block_type = @mcapi.get_block_type(0,0,0)
    block_type.should eq(BlockType::SAND)
  end

  it "can create multiple blocks" do
    @mcapi.set_blocks(0,0,0,2,2,2,BlockType::SAND)
    # need to figure out assertion here.
    # The assertions on each vector come too fast and end up returning
    # types of 0.
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

  describe "Camera API" do
    it "can be set to normal" do
      @mcapi.camera_mode(:normal)
    end

    it "can be set to third person" do
      @mcapi.camera_mode(:third_person)
    end

    it "can be set to fixed" do
      @mcapi.camera_mode(:fixed)
    end

    it "can be set to a certain position" do
      @mcapi.camera_mode(:position,10,20,30)
    end

    it "throws an error when an invalid mode is specified" do
      expect {
        @mcapi.camera_mode(:fake)
      }.to raise_error(RuntimeError, "valid camera settings are: :normal, :third_person, :fixed, and :position")
    end
  end

  describe "Player API" do
    it "can put the player on a particular tile" do
      @mcapi.player_set_tile(20,40,60)
      vector = @mcapi.player_get_tile
      vector.should eq([20,40,60])
    end

    it "can put the player somewhere else" do
      @mcapi.player_set_tile(-5,10,15)
      vector = @mcapi.player_get_tile
      vector.should eq([-5,10,15])
    end
  end

end
