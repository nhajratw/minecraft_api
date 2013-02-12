class Camera

  def initialize(api)
    @api = api
  end

  def mode(mode,x=nil,y=nil,z=nil)
    case mode
    when :normal then command = "setNormal()"
    when :third_person then command = "setThirdPerson()"
    when :fixed then command = "setFixed()"
    when :position then command = "setPos(#{x},#{y},#{z})"
    else raise RuntimeError.new("valid camera settings are: :normal, :third_person, :fixed, and :position")
    end
    
    @api.send("camera.mode.#{command}")
  end

end
