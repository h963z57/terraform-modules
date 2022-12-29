variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "projectname" {
  type    = string
  default = "change me"
}

variable "network" {
  type    = string
  default = ""
}

variable "allow_ingress_ports_tcp" {
  description = "List of Ports to open server"
  type        = list(any)
  default     = ["-1"]
}

variable "allow_ingress_ports_udp" {
  description = "List of Ports to open server"
  type        = list(any)
  default     = ["-1"]
}

variable "allow_egress_ports" {
  description = "List of Ports to open server"
  type        = list(any)
  default     = ["-1"]
}