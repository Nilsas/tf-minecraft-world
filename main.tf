terraform {
  required_providers {
    minecraft = {
      source  = "HashiCraft/minecraft"
      version = "0.1.0"
    }
  }
}

// Configure the provider with the RCON details of the Minecraft server
provider "minecraft" {
  address  = "10.0.0.102:27015"
  password = "PlastmasinisAtsuktuvas./12"
}

// Create a Minecraft block
# resource "minecraft_block" "stone" {
#   material = "minecraft:stone"

#   position = {
#     x = -195
#     y = -59
#     z = -193
#   }
# }

# resource "minecraft_block" "rect_floor" {
#   count = 5
#   material = "minecraft:cobblestone"

#   position = {
#     x = -192 + count.index
#     y = -60
#     z = -195
#    }
# }


// Module that creates a cube out of Minecraft blocks
module "floor" {
  source = "./cube"

  material = "spruce_planks"

  position = {
    x = -198,
    y = -60,
    z = -195
  }

  dimensions = {
    width  = 10,
    length = 10,
    height = 1
  }
}

module "walls" {
  source = "./wall"

  material = "stone_bricks"

  position = {
    x = -198,
    y = -60,
    z = -195
  }

  dimensions = {
    width  = 10,
    length = 1,
    height = 10
  }
}



module "walls_1" {
  source = "./wall"

  material = "stone_bricks"

  position = {
    x = -178,
    y = -60,
    z = -175
  }

  dimensions = {
    width  = 8,
    length = 1,
    height = 8
  }
}

module "walls_2" {
  source = "./wall"

  material = "stone_bricks"

  position = {
    x = -158,
    y = -60,
    z = -155
  }

  dimensions = {
    width  = 6,
    length = 1,
    height = 6
  }
}

module "walls_3" {
  source = "./wall"

  material = "stone_bricks"

  position = {
    x = -148,
    y = -60,
    z = -145
  }

  dimensions = {
    width  = 4,
    length = 1,
    height = 4
  }
}