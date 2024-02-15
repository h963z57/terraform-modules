Droplet module Digitalocean
============

```tf
module "droplets" {
  source               = 
  image = "debian-12-x64"
  region = "fra1"
  size   = "s-1vcpu-512mb-10gb"
  ssh_keys = ["33:a1:a9:3b3:77:6f:a2:36:95:fd:de"]
  names   = ["node-1"]
}
```