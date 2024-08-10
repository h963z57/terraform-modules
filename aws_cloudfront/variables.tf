variable "env" {
  type    = string
  default = "develop"
}

variable "comment" {
  type    = string
  default = "chame"
}

variable "bucket" {
  type    = string
  default = ""
}

variable "bucket_arn" {
  type    = string
  default = ""
}

variable "bucket_domain" {
  type    = string
  default = ""
}

variable "acm_crt" {
  type    = string
  default = ""
}

variable "aliases" {
  type    = list(any)
  default = []
}

variable "price_class" {
  type    = string
  default = ""
}