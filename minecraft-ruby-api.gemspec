$:.push File.expand_path("../lib", __FILE__)
Gem::Specification.new do |s|
  s.name          = 'minecraft-ruby-api'
  s.description   = 'An API for the Raspberry Pi version of Minecraft'
  s.version       = '0.0.1'
  s.date          = '2013-01-25'
  s.summary       = 'Minecraft Ruby API'
  s.homepage      = 'https://github.com/nhajratw/minecraft-ruby-api'
  s.authors       = ["Nayan Hajratwala"]
  s.email         = ["nayan@chikli.com"]
  s.files         = `git ls-files`.split("\n")
end
