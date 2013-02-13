describe 'the World' do
  let(:api) { double() }
  let(:world) { World.new(api) }

  it 'sends the proper setBlock command for normal blocks' do
    api.should_receive(:send).with("world.setBlock(10,20,30,20)")
    world.block(10,20,30,Block::GLASS)
  end

  it 'sends the proper setBlock command for blocks with extra data' do
    api.should_receive(:send).with("world.setBlock(5,6,7,35,14)")
    world.block(5,6,7,Wool.new(Color::RED))
  end

  it 'sends the proper setBlocks command for normal blocks' do
    api.should_receive(:send).with("world.setBlocks(10,20,30,40,50,60,20)")
    world.cube(10,20,30,40,50,60,Block::GLASS)
  end

  it 'sends the proper setBlocks command for blocks with extra data' do
    api.should_receive(:send).with("world.setBlocks(5,6,7,9,9,9,35,14)")
    world.cube(5,6,7,9,9,9,Wool.new(Color::RED))
  end

  it 'translates data into blocks' do
    api.stub(:send_and_receive).with("world.getBlock(5,6,7)") { "10" }
    block = world.block_at(5,6,7)
    block.should == Block::LAVA_FLOWING
  end

  it 'translates data into blocks with extra data' do
    api.stub(:send_and_receive).with("world.getBlock(5,6,7)") { "35,14" }
    block = world.block_at(5,6,7)
    block.should == Wool.new(Color::RED)
  end
end
