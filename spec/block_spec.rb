require 'block'

describe 'Block' do

  it 'is equivalent to another block with the same id' do
    block1 = Block.new(0)
    block2 = Block.new(0)
    block1.should eq(block2)
  end
end
