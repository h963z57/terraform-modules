variable "zone" {
  type    = string
  default = ""
}

variable "size" {
  type    = number
  default = "20"
}

variable "type" {
  type    = string
  default = "standard"
}

variable "encrypted" {
  type    = bool
  default = false
}

variable "final_snapshot" {
  type    = bool
  default = false
}

variable "tag_name" {
  type    = string
  default = "cnange-me"
}

variable "env" {
  type    = string
  default = "test"
}

variable "owner" {
  type    = string
  default = "nobody"
}

variable "attach_state" {
  type    = bool
  default = false
}

variable "device_name" {
  type    = string
  default = ""
}

variable "instance_id" {
  type    = string
  default = ""
}