# The camera
class Camera
  # Initialize the camera object
  #
  # @param api [MinecraftApi] API to use
  def initialize(api)
    @api = api
  end

  # Change camera mode
  #
  # @param mode [Symbol] camera mode (normal, third_person, fixed or position)
  # @param x [Double, nil] x coordinate to use when positioning
  # @param y [Double, nil] y coordinate to use when positioning
  # @param z [Double, nil] z coordinate to use when positioning
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
