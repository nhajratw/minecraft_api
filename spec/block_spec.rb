require 'block'

describe 'Block' do

  it 'maps the ids from the API to actual blocks' do

    Block.new(1).material.should eq(:air)
    Block.new(12).material.should eq(:sand)
  end

end
