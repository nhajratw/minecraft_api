require 'block'

describe 'Block' do
  it 'can be created without any extra data' do
    block = Block.new(BlockType::GLASS)
    block.type.should == BlockType::GLASS
  end
end

