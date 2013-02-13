require 'block'

describe 'Block' do

  it 'is equivalent to another type with the same id' do
    b1 = Block.new(0)
    b2 = Block.new(0)
    b1.should eq(b2)
  end
end
