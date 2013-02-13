require 'wool'

describe 'Wool' do
  it 'can be created with color' do
    wool = Wool.new(Color::RED)
    wool.color.should == Color::RED
  end

  it 'wool instances should be equal' do
    wool1 = Wool.new(Color::RED)
    wool2 = Wool.new(Color::RED)
    wool1.should == wool2
  end

  it 'wool instances should be equal' do
    wool1 = Wool.new(Color::RED)
    wool2 = Wool.new(Color::BLACK)
    wool1.should_not == wool2
  end
end

