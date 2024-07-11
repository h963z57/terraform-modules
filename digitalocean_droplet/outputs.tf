output "droplet_ids" {
  value = { for name, droplet in digitalocean_droplet.node : name => droplet.id }
}

output "droplet_ips" {
  value = { for name, droplet in digitalocean_droplet.node : name => droplet.ipv4_address }
}

output "droplet_ipv6" {
  value = { for name, droplet in digitalocean_droplet.node : name => droplet.ipv6_address }
}