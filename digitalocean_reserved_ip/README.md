Reserved_ip module Digitalocean
============

```tf
module "reserved_ip" {
  source               = 
  region = "fra1"
  reserved_ips = {
    "node-1" = data.terraform_remote_state.digitalocean_droplet.outputs.droplet_ids["node-1"]
  }
}
```