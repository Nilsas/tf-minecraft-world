module "wall_1" {
  source   = "../cube"
  material = var.material

  position = {
    x = var.position.x + signum(var.position.x)
    y = var.position.y
    z = var.position.z + signum(var.position.z)
  }

  dimensions = {
    width  = var.dimensions.width + 2
    length = var.dimensions.length
    height = var.dimensions.height
  }
}

module "wall_2" {
  source = "../cube"
  material = var.material

  position = {
    x = var.position.x + signum(var.position.x)
    y = var.position.y
    z = var.position.z
  }

  dimensions = {
    width  = var.dimensions.length
    length = var.dimensions.width +1
    height = var.dimensions.height
  }
}

module "wall_3" {
  source = "../cube"
  material = var.material

  position = {
    x = var.position.x + var.dimensions.width
    y = var.position.y
    z = var.position.z
  }

  dimensions = {
    width  = var.dimensions.length
    length = var.dimensions.width
    height = var.dimensions.height
  }
}

module "wall_4" {
  source = "../cube"
  material = var.material

  position = {
    x = var.position.x
    y = var.position.y
    z = var.position.z + var.dimensions.height
  }

  dimensions = {
    width  = var.dimensions.width + 1
    length = var.dimensions.length
    height = var.dimensions.height
  }
}