EIP module aws
===========

```tf
module "aws_iam" {
    source = "git@github.com:h963z57/terraform-modules.git//aws_eip"
        instances = {
        "name1" = "instance_id"
        "name2" = ""
    }
}
```