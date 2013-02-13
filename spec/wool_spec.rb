require 'wool'

describe 'Wool' do
  it 'can be created with color' do
    wool = Wool.new(Color::RED)
    wool.color.should == Color::RED
  end
end

