EFS module aws
===========

```tf
module "aws_efs" {
  source    = "git@github.com:h963z57/terraform-modules.git//aws_efs"
  env       = var.ENVIRONMENT
  subnet_id = ""
  # throughput_mode = "burstable"
  # default_ap = false
  names = {
      "example" = ["sg1", "sg2"]
    ...
  }
}
```