SG module AWS
============
```tf
module "sg" {
  source = "git@github.com:h963z57/terraform-modules.git//aws_sg"
  env                     = "env"
  projectname             = "name"
  vpc_id                  = "vpc_id"
  allow_ingress_ports_tcp = ["22", "23", "24"]
  allow_ingress_ports_udp = ["13231", "53"]
  description             = "description"
  # allow_egress_ports   = ["0"] # accept all egress by default
  # ingress_rules_advanced = [
  #   {
  #     protocol = "TCP" # UDP
  #     description = "Auto generated rule by terraform (advanced mode)"
  #     v4_cidr_blocks = ["10.0.0.0/24"]
  #     v6_cidr_blocks = []
  #     port = "9100"
  #   }
  # ]
  # egress_rules_advanced = [
  #      {
  #          protocol = "TCP" # UDP
  #          description = "description"
  #          v4_cidr_blocks = ["10.0.0.0/24"]
  #          v6_cidr_blocks = []
  #          port = "9100"
  #      }
  #]
  # ipv6_dualstack = false
}
```