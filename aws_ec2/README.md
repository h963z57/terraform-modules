EC2 module aws
===========

```tf
module "ec2_module" {
  source = "git@github.com:h963z57/terraform-modules.git//aws_ec2"

  env    = var.ENVIRONMENT
  name   = "master"
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnet_ids[0]
  vpc_security_group_ids = [
    data.terraform_remote_state.sg.outputs.security_group_common_id,
    data.terraform_remote_state.sg.outputs.security_group_main_id,
    data.terraform_remote_state.sg.outputs.security_group_db_id,
    data.terraform_remote_state.sg.outputs.security_group_efs_id,
  ]
  user_data   = "empty.sh"

  instances = [
    { 
      name                          = "k3s-worker-0"
      volume_size                   = 20
      volume_type                   = "standard"
      associate_public_ip_address   = false
      instance_type                 = "t4g.medium"
      ami                           = "ami-0056a7c4c0c442db6"
      cpu_credits                   = "standard"
    },
    { 
      name                          = "k3s-worker-1"
      volume_size                   = 30
      volume_type                   = "gp3"
      associate_public_ip_address   = true
      instance_type                 = "t4g.large"
      ami                           = "ami-0056a7c4c0c442db6"
      cpu_credits                   = "unlimited"
    }
  ]

  public_key     = "ssh-ed25519 AAAAC3NzaC1lZDI1dFzXFsdzFrIDGXcE/j"
  # allow_aws_efs  = values(local.all_efs_file_system_ids)
}
```