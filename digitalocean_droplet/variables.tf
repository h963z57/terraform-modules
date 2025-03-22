variable "env" {
  type    = string
  default = "develop"
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
  type = list(string)
}

variable "names" {
  type = list(object({
    name   = string
    size   = string
    region = string
    image  = string
  }))
}