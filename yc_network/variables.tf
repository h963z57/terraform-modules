variable "folder_id" {
  type    = string
  default = ""
}

variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "network_name" {
  type    = string
  default = "change me"
}

variable "env" {
  type    = string
  default = "CHANGE ME"
}

variable "public_subnet_cidrs" {
  type = list(any)
  default = [
    #  "10.0.0.0/24"
  ]
}

variable "vpc_static_address" {
  type = list(any)
  default = [
    # "change me"
  ]
}

/*
variable "private_subnet_cidrs" {
  type = list(any)
  default = [
    #  "10.0.0.0/24"
  ]
}
*/
