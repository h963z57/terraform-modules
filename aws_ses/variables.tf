variable "env" {
  type    = string
  default = "develop"
}

variable "domains" {
  type    = list(string)
  default = []
}

variable "ses-smtp-user" {
  type    = string
  default = "ses-smtp-user"
}

variable "ses_keys" {
  type    = list(string)
  default = []
}