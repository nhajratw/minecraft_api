require 'wool'

describe 'Wool' do
  it 'can be created with color' do
    wool = Wool.new(Color::RED)
    wool.type.should == BlockType::WOOL
    wool.color.should == Color::RED
  end
end

