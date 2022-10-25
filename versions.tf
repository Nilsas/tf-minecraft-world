terraform {
  required_providers {
    minecraft = {
      source  = "HashiCraft/minecraft"
      version = "0.1.0"
    }
  }
}

provider "minecraft" {
  address  = "127.0.0.1:27015"
  password = var.rconpasswd
}
