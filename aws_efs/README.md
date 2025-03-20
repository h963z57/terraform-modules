EFS module aws
===========

```tf
module "aws_efs" {
   # source     = "git@github.com:h963z57/terraform-modules.git//aws_efs"
   env        = var.ENVIRONMENT
   subnet_id  = data.terraform_remote_state.vpc.outputs.public_subnet_ids[0]
   names = [
     {
       name            = "email"
       security_groups = [data.terraform_remote_state.sg.outputs.security_group_efs_id]
       default_ap      = true
       throughput_mode = "bursting"
     },
     {
       name            = "cloud"
       security_groups = [data.terraform_remote_state.sg.outputs.security_group_efs_id]
       default_ap      = true
       throughput_mode = "elastic"
     }
   ]
 }
```