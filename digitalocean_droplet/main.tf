terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_droplet" "node" {
  for_each = { for n in var.names : n.name => n }

  ipv6     = true
  image    = each.value.image
  name     = "${var.env}-${each.value.name}"
  region   = each.value.region
  size     = each.value.size
  ssh_keys = var.ssh_keys
}