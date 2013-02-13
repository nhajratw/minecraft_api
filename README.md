Minecraft API for the Raspberry Pi
----------------------------------

An API for the Raspberry Pi version of minecraft

Prerequisites:

  * A [Raspberry Pi](http://www.raspberrypi.org)
  * [Prerelease version of Minecraft](https://dl.dropbox.com/s/hqk8wsdzlyyujli/minecraft-pi-0.1.tar.gz)

To install:

    gem install minecraft-api

and in your code:

    require 'minecraft-api'

    api = MinecraftApi.new(hostname, 4711) # <-- where ever your server is
    api.world.set_block(5,10,15,Block::WOOD)
    api.player.go(20,40,60)

    etc...


