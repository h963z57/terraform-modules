VPC YC
============

```tf
module "vpc" {
    source              = "git@github.com:h963z57/terraform_modules.git//yc_network"
    //zone                = ""
    network_name        = "NAME"
    env                 = "prod"
    public_subnet_cidrs = ["10.0.0.0/24"]
    //vpc_static_address  = [""]
}
```