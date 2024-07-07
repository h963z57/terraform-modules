terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_droplet" "node" {
  for_each = var.names
  ipv6     = true
  image    = var.image
  name     = each.value
  region   = var.region
  size     = var.size
  ssh_keys = var.ssh_keys
}