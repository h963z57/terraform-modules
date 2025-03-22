Droplet module Digitalocean
============

```tf
module "droplets" {
  source   = "git@github.com:h963z57/terraform-modules.git//digitalocean_droplet"
  env      = var.ENVIRONMENT
  ssh_keys = ["33:a1:a9:35:ff:17:a3:1b:b3:77:6f:a2:36:95:fd:de"]
  names = [
    {
      name   = "example-1"
      size   = "s-1vcpu-512mb-10gb"
      region = "fra1"
      image  = "debian-12-x64"
    },
    {
      name   = "example-1"
      size   = "s-1vcpu-512mb-10gb"
      region = "fra1"
      image  = "debian-12-x64"
    },
  ]
}
```