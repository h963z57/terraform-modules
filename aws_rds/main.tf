terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 5.0"
    }
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
  
  backup_retention_period = var.backup_retention_period != "" ? var.backup_retention_period : null
  backup_window           = var.backup_window != "" ? var.backup_window : null

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