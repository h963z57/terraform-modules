RDS module aws
===========

```tf
module "rds" {
  source = "git@github.com:h963z57/terraform-modules.git//aws_rds"
  env                    = var.ENVIRONMENT
  name                   = "test"
  availability_zone      = "eu-central-1a"
  # instance_class         = "db.t4g.micro"
  # allocated_storage      = 20
  # storage_type           = "standard"
  # engine                 = "postgres"
  engine_version         = "16.4"
  rds_username           = "mysuperpuperlogin"
  rds_password           = "mysuperuser"
  vpc_security_group_ids = []
  db_subnet_group        = <subnet ids at least 2>
  # apply_immediately      = false
  # publicly_accessible    = false
  # network_type           = "IPV4"
  # skip_final_snapshot    = true
  # multi_az               = false
  # backup_retention_period = 7
  # backup_window          = "07:00-09:00"

  # custom_params            = false
  # family_ver               = "16"
  # force_ssl                = true
}
```