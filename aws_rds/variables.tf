variable "env" {
  type    = string
  default = "develop"
}

variable "availability_zone" {
  type = string
  default = ""
}

variable "apply_immediately" {
  type = bool
  default = false
}

variable "network_type" {
  type = string
  default = "IPV4"
}

variable "custom_params" {
  type = bool
  default = false
}

variable "family_ver" {
  type    = number
  default = 16
}

variable "name" {
  type    = string
  default = "chame"
}

variable "instance_class" {
  type    = string
  default = "db.t4g.micro"
}

variable "allocated_storage" {
  type    = number
  default = 20
}

variable "storage_type" {
  type    = string
  default = "standard"
}

variable "engine" {
  type    = string
  default = "postgres"
}

variable "engine_version" {
  type    = string
  default = "16.4"
}

variable "rds_username" {
  type    = string
  default = "16.4"
}

variable "rds_password" {
  type    = string
  default = "16.4"
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "db_subnet_group" {
  type = list(any)
  default = []
}

variable "publicly_accessible" {
  type    = bool
  default = false
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "multi_az" {
  type    = bool
  default = false
}

variable "backup_retention_period" {
  type = number
  default = 7
}

variable "backup_window" {
  type = string
  default = "07:00-09:00"
}

variable "force_ssl" {
  type    = bool
  default = true
}