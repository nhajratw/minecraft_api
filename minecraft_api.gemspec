$:.push File.expand_path("../lib", __FILE__)
Gem::Specification.new do |s|
  s.name          = 'minecraft_api'
  s.description   = 'An API for the Raspberry Pi version of Minecraft'
  s.version       = '0.1.0'
  s.date          = '2013-02-14'
  s.summary       = 'Minecraft API'
  s.homepage      = 'https://github.com/nhajratw/minecraft_api'
  s.authors       = ["Nayan Hajratwala"]
  s.email         = ["nayan@chikli.com"]
  s.files         = `git ls-files`.split("\n")
end
