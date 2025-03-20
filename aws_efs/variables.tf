variable "env" {
  type    = string
  default = "develop"
}

variable "throughput_mode" {
  type    = string
  default = "bursting"
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "names" {
  type = list(object({
    name             = string
    security_groups  = list(string)
    default_ap       = optional(bool, false)
    throughput_mode  = optional(string, "bursting")
  }))
}

variable "default_ap" {
  default = true
}