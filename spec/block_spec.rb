require 'block_factory'

describe 'Block Factory' do

  it 'maps the ids from the API to actual blocks' do

    block = BlockFactory.block('12')
    block.material.should eq(:sand)
  end

end
