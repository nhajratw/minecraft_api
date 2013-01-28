require 'minecraft_api'

describe "Minecraft server" do

  it "returns a 'Fail' when a bad command is sent" do

    mcapi = MinecraftApi.new
    mcapi.connect

    response = mcapi.send 'junk'

    response.should eq('Fail')
  end

  it "returns a block when a block request is sent" do
    mcapi = MinecraftApi.new
    mcapi.connect

    response = mcapi.send 'world.getBlock(0,0,0)'
    response.should eq('12')
  end
end
