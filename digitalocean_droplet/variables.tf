variable "names" {
  type    = set(string)
  default = []
}

variable "image" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

variable "size" {
  type    = string
  default = ""
}

variable "ssh_keys" {
  type    = list(any)
  default = []
}