variable "latest_image" {
  type    = string
  default = "debian-12-amd64-*"
}

variable "name" {
  type    = string
  default = "changeme"
}

variable "ami" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = "t3a.nano"
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "vpc_security_group_ids" {
  type    = list(any)
  default = []
}

variable "user_data" {
  type    = string
  default = "empty.sh"
}

variable "associate_public_ip_address" {
  type    = bool
  default = true
}

variable "volume_size" {
  type    = number
  default = 16
}

variable "volume_type" {
  type    = string
  default = "gp2"
}

# variable "core_count" {
#     type = number
#     default = 1
# }

# variable "threads_per_core" {
#     type = number
#     default = 1
# }

variable "env" {
  type    = string
  default = "test"
}

variable "instances" {
  type = list(object({
    name                          = string
    volume_size                   = number
    volume_type                   = string
    associate_public_ip_address   = bool
    instance_type                 = string
    ami                           = string
    cpu_credits                   = string
  }))
}

variable "public_key" {
  type    = string
  default = ""
}

variable "cpu_credits" {
  type    = string
  default = ""
}

variable "state_allow_aws_efs" {
  type    = bool
  default = false
}

variable "allow_aws_efs" {
  type    = list(string)
  default = []
}