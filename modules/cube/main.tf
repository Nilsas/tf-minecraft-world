locals {
  x_values = range(var.position.x, var.position.x + var.dimensions.width)
  y_values = range(var.position.y, var.position.y + var.dimensions.height)
  z_values = range(var.position.z, var.position.z + var.dimensions.length)

  coordinates = setproduct(local.x_values, local.y_values, local.z_values)

  blocks   = [for coordinate in local.coordinates : zipmap(["x", "y", "z"], coordinate)]
  material = length(regexall("^[a-z]+:[a-z]+$", var.material)) > 0 ? var.material : format("%s:%s", "minecraft", var.material)
}

resource "minecraft_block" "cube" {
  for_each = { for i, o in local.blocks : "block-${i}" => o }
  material = local.material

  position = {
    x = each.value.x
    y = each.value.y
    z = each.value.z
  }
}
