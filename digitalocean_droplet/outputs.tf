output "droplets_info" {
  value = {
    for droplet in digitalocean_droplet.node :
    replace(droplet.name, "${var.env}-", "") => {
      id            = droplet.id
      public_ipv4   = droplet.ipv4_address
      public_ipv6   = droplet.ipv6_address
      region        = droplet.region
      size          = droplet.size
      image         = droplet.image
    }
  }
}