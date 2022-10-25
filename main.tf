# module "walls" {
#   source = "./modules/walls"

#   material = "stone_bricks"

#   position = {
#     x = -10
#     y = -60
#     z = -4
#   }

#   dimensions = {
#     width  = 6
#     length = 1
#     height = 10
#   }
# }

module "tree" {
  source = "./modules/tree"
  position = {
    x = -10
    y = -60
    z = -4
  }
}