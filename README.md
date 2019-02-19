<div align="center">
    <img src="banner.png">
    <h1>Minecraft API for the Raspberry Pi</h1>
</div>

A Ruby API for the Raspberry Pi version of minecraft

## Setup

Prerequisites :

- A [Raspberry Pi](http://www.raspberrypi.org/products)
- [Minecraft Raspberry Pi Edition](https://minecraft.net/en-us/edition/pi)

Install the gem using the classic command :

```bash
gem install minecraft_api
```

Then, setup your code by importing the `minecraft_api` gem and connecting to your game.

```ruby
require 'minecraft_api'

# hostname should be the ip or hostname of your server.
# port defaults to 4711, but you can override it.
api = MinecraftApi.new(hostname)
```

## Playing around

```ruby
# Set a block somewhere
api.world.block(5,10,15,Block::WOOD)

# Teleport the player away
api.player.go(20,40,60)

# Place a colored wool
my_wool = Wool.new(Color.PURPLE)
api.world.block(1,5,10,my_wool)
```
