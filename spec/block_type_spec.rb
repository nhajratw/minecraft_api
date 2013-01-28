require 'block_type'

describe 'BlockType' do

  it 'is equivalent to another block type with the same id' do
    bt1 = BlockType.new(0)
    bt2 = BlockType.new(0)
    bt1.should eq(bt2)
  end
end
