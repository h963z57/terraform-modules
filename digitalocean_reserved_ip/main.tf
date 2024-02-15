terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_floating_ip" "module" {
  for_each = var.reserved_ips
  region   = var.region
}

resource "digitalocean_floating_ip_assignment" "module" {
  for_each   = { for name, id in var.reserved_ips : name => id if id != "" }
  ip_address = digitalocean_floating_ip.module[each.key].ip_address
  droplet_id = each.value
}

