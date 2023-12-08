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