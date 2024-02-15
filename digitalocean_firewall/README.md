Firewall module Digitalocean
============

```tf
module "default_rules" {
    source               = ""
    name = "default"
    droplet_ids = [data.terraform_remote_state.digitalocean_droplet.outputs.droplet_ids["node-1"]]
    allow_ingress_ports_tcp = ["0"]
    allow_ingress_ports_udp = ["0"]
    allow_egress_ports_tcp = ["0"]
    allow_egress_ports_udp = ["0"]
    ingress_rules_advanced = [
        {
            protocol = "tcp"
            v4_cidr_blocks = ["1.1.1.1"]
            port = "22"
        }
    ]
    egress_rules_advanced = [
        {
            protocol = "tcp"
            v4_cidr_blocks = ["1.1.1.1"]
            port = "22"
        }
    ]
}
```