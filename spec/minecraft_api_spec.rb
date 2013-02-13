require 'minecraft_api'

describe "Minecraft API", :integration => true do

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

  describe "The World" do

    let(:world) { @mcapi.world }

    it "can have blocks placed in it" do
      world.block(0,0,0,Block::WOOD)
      block = world.block_at(0,0,0)
      block.should eq(Block::WOOD)
    end

    it "can create a block of a different type" do
      world.block(0,0,0,Block::SAND)
      block = world.block_at(0,0,0)
      block.should eq(Block::SAND)
    end

    it "can create a block colored wool" do
      wool = Wool.new(Color::RED)
      world.block(0,0,0,wool)
      block = world.block_at(0,0,0)
      block.should eq(wool)
    end

    it "can create cubes" do
      world.cube(0,0,0,2,2,2,Block::SAND)
      # need to figure out assertion here.
      # The assertions on each vector come too fast and end up returning
      # types of 0.
    end

    it "can get the height of the world" do
      y = world.height(5,5)
      y.should eq(7)
    end

    it "can checkpoint save" do
      world.save
    end

    it "can checkpoint restore" do
      world.restore
    end

    it "can send chats" do
      world.chat_post("hello")
    end
  end

  describe "Camera" do
    let(:camera) { @mcapi.camera }

    it "can be set to normal" do
      camera.mode(:normal)
    end

    it "can be set to third person" do
      camera.mode(:third_person)
    end

    it "can be set to fixed" do
      camera.mode(:fixed)
    end

    it "can be set to a certain position" do
      camera.mode(:position,10,20,30)
    end

    it "throws an error when an invalid mode is specified" do
      expect {
        camera.mode(:fake)
      }.to raise_error(RuntimeError, "valid camera settings are: :normal, :third_person, :fixed, and :position")
    end
  end

  describe "Player" do

    let(:player) { @mcapi.player }

    it "can go to a particular tile" do
      player.go(20,40,60)
      vector = player.location
      vector.should eq([20,40,60])
    end

    it "can go to another tile" do
      player.go(-5,10,15)
      vector = player.location
      vector.should eq([-5,10,15])
    end
  end

end
