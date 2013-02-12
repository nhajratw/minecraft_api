class Player
  def initialize(api)
    @api = api
  end

  def go(x,y,z)
    @api.send("player.setTile(#{x},#{y},#{z})")
  end

  def location
    response = @api.send_and_receive("player.getTile()")
    response.split(',').map { |s| s.to_i }
  end    
end
