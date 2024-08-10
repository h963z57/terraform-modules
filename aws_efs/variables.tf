variable "env" {
  type    = string
  default = "develop"
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "names" {
  description = "Mapping of EFS names to their respective security groups"
  type        = map(list(string))
}