variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "env" {
  default = "change-me"
}

variable "public_subnet_cidrs" {
  default = []
}

variable "private_subnet_cidrs" {
  default = []
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "ipv6_state" {
  type    = bool
  default = false
}

variable "assign_ipv6_address_on_creation" {
  type    = bool
  default = false
}