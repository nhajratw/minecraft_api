require 'minecraft_api'

describe "Minecraft server" do

  it "should return a 'Fail' when a bad command is sent" do

    mcapi = MinecraftApi.new
    mcapi.connect

    response = mcapi.send 'junk'

    response.should eq('Fail')
  end

end
