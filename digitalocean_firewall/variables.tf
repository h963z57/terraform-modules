variable "name" {
  type    = string
  default = "changeme"
}

variable "droplet_ids" {
  type    = list(any)
  default = []
}

variable "allow_ingress_ports_tcp" {
  type    = list(any)
  default = []
}

variable "allow_ingress_ports_udp" {
  type    = list(any)
  default = []
}

variable "allow_egress_ports_tcp" {
  type    = list(any)
  default = []
}

variable "allow_egress_ports_udp" {
  type    = list(any)
  default = []
}

variable "ingress_rules_advanced" {
  type = list(object({
    protocol       = string
    v4_cidr_blocks = list(string)
    port           = number
  }))
  default = [
    # {
    #   protocol = "TCP"
    #   description = "Auto generated rule by terraform (advanced mode)"
    #   v4_cidr_blocks = ["0.0.0.0/0"]
    #   port = "-1"
    # },
    # {
    #   protocol = "UDP"
    #   description = "Auto generated rule by terraform (advanced mode)"
    #   v4_cidr_blocks = ["0.0.0.0/0"]
    #   port = "-1"
    # }
  ]
}

variable "egress_rules_advanced" {
  type = list(object({
    protocol       = string
    v4_cidr_blocks = list(string)
    port           = number
  }))
  default = [
    # {
    #   protocol = "TCP"
    #   description = "Auto generated rule by terraform"
    #   v4_cidr_blocks = ["0.0.0.0/0"]
    #   port = "-1"
    # },
    # {
    #   protocol = "UDP"
    #   description = "Auto generated rule by terraform"
    #   v4_cidr_blocks = ["0.0.0.0/0"]
    #   port = "-1"
    # }
  ]
}