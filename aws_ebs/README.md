EBS module aws
===========
Creates ebs and attach to ec2 instance if need

```tf
module "aws_ebs" {
  source = "git@github.com:h963z57/terraform-modules.git//aws_ebs"
  zone = "region"
  size = "10"
  # type = "standard"
  # encrypted = false
  # final_snapshot = false
  # tag_name     = "name"
  # env          = "env"
  # owner        = "Your name"
  
  # if you need to attach 
  attach_state = true
  device_name  = "/dev/sdb"
  instance_id  = "ec2_instance_id"
}
```