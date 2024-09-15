VPC module AWS
============

```tf
module "vpc" {
  source = "git@github.com:h963z57/terraform-modules.git//aws_vpc"
  env                  = "env"
  vpc_cidr             = "10.13.0.0/16"
  public_subnet_cidrs  = ["10.13.10.0/24"]
  private_subnet_cidrs = []
  # enable_dns_support   = true
  # enable_dns_hostnames = true
  # ipv6_state = false
  # assign_ipv6_address_on_creation = false
}
```