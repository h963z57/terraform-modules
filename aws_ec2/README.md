EC2 module aws
===========

```tf
module "aws_ec2" {
  source = "git@github.com:h963z57/terraform-modules.git//aws_ec2"
  ami                    = "ami_id"
  instance_type          = "t4g.medium"
  subnet_id              = "subnet_id"
  vpc_security_group_ids = ["sg ids"]
  user_data              = "<path to user data>"
  volume_size            = 20
  # cpu_credits          = "" # standard unlimited
  # volume_type = "gp2"
  names       = ["list", "of", "ec2", "instance"]
  public_key = "ssh-ed25519 AAAAC3DGXcE/j"
  # allow_aws_efs = ["fs-04e92d5ef38908a77"]
}
```