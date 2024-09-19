terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 5.0"
    }
  }
}

resource "aws_db_parameter_group" "module" {
  count       = var.custom_params ? 1 : 0
  name        = "${var.env}-${var.name}-rds-pg-parameter-group"
  family      = "${var.engine}${var.family_ver}"

  parameter {
    name         = "rds.force_ssl"
    value        = var.force_ssl ? "1" : "0" 
    apply_method = "pending-reboot"
  }
}

resource "aws_db_instance" "module" {
  identifier              = "${var.env}-${var.name}"
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  storage_type            = var.storage_type
  engine                  = var.engine 
  engine_version          = var.engine_version 
  username                = var.rds_username
  password                = var.rds_password
  db_subnet_group_name    = aws_db_subnet_group.module.name
  vpc_security_group_ids  = var.vpc_security_group_ids
  publicly_accessible     = var.publicly_accessible
  skip_final_snapshot     = var.skip_final_snapshot
  multi_az                = var.multi_az
  availability_zone       = var.availability_zone != "" ? var.availability_zone : null
  network_type            = var.network_type
  apply_immediately       = var.apply_immediately
  
  backup_retention_period = var.backup_retention_period != "" ? var.backup_retention_period : null
  backup_window           = var.backup_window != "" ? var.backup_window : null
  
  parameter_group_name    = var.custom_params ? aws_db_parameter_group.module[0].name : null
  
  # monitoring_interval = 60
  # monitoring_role_arn = aws_iam_role.rds_monitoring.arn
}
resource "aws_db_subnet_group" "module" {
  name       = "${var.env}-${var.name}-subnet-group"
  subnet_ids = var.db_subnet_group

  tags = {
    Name = "${var.env}-${var.name}-subnet-group"
  }
}