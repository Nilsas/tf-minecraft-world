locals {
  trunk_x = range(var.position.x, var.position.x + 2)
  trunk_y = range(var.position.y, var.position.y + 8)
  trunk_z = range(var.position.z, var.position.z + 2)

  leaves_x = range(var.position.x - 1, var.position.x + 3)
  leaves_y = range(var.position.y + 8, var.position.y + 11)
  leaves_z = range(var.position.z - 1, var.position.z + 3)

  t_coordinates = setproduct(local.trunk_x, local.trunk_y, local.trunk_z)
  t_blocks   = [for coordinate in local.t_coordinates : zipmap(["x", "y", "z"], coordinate)]

  l_coordinates = setproduct(local.leaves_x, local.leaves_y, local.leaves_z)
  l_blocks   = [for coordinate in local.l_coordinates : zipmap(["x", "y", "z"], coordinate)]
}

resource "minecraft_block" "trunk" {
  for_each = { for i, o in local.t_blocks : "block-${i}" => o }
  material = "minecraft:stripped_oak_log"

  position = {
    x = each.value.x
    y = each.value.y
    z = each.value.z
  }
}

resource "minecraft_block" "leaves" {
  for_each = { for i, o in local.l_blocks : "leaves-${i}" => o }
  material = "minecraft:birch_leaves"

  position = {
    x = each.value.x
    y = each.value.y
    z = each.value.z
  }
}