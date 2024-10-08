# variable "zone" {
#   type    = string
#   default = "ru-central1-a"
# }

variable "env" {
  type    = string
  default = "test"
}

variable "projectname" {
  type    = string
  default = "change me"
}

variable "description" {
  type    = string
  default = "test"
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "allow_ingress_ports_tcp" {
  type    = list(any)
  default = []
}

variable "allow_ingress_ports_udp" {
  type    = list(any)
  default = []
}

variable "allow_egress_ports" {
  type    = list(any)
  default = ["0"]
}

# ============ Advanced rules ipv4 ===============

variable "ingress_rules_advanced" {
  type = list(object({
    protocol       = string
    description    = string
    v4_cidr_blocks = list(string)
    v6_cidr_blocks = list(string)
    port           = number
  }))
  default = [
    # {
    #   protocol = "TCP"
    #   description = "Auto generated rule by terraform (advanced mode)"
    #   v4_cidr_blocks = ["0.0.0.0/0"]
    #   v6_cidr_blocks = ["::/0"]
    #   port = "-1"
    # },
    # {
    #   protocol = "UDP"
    #   description = "Auto generated rule by terraform (advanced mode)"
    #   v4_cidr_blocks = ["0.0.0.0/0"]
    #   v6_cidr_blocks = ["::/0"]
    #   port = "-1"
    # }
  ]
}

variable "egress_rules_advanced" {
  type = list(object({
    protocol       = string
    description    = string
    v4_cidr_blocks = list(string)
    v6_cidr_blocks = list(string)
    port           = number
  }))
  default = [
    # {
    #   protocol = "TCP"
    #   description = "Auto generated rule by terraform"
    #   v4_cidr_blocks = ["0.0.0.0/0"]
    #   v6_cidr_blocks = ["::/0"]
    #   port = "-1"
    # },
    # {
    #   protocol = "UDP"
    #   description = "Auto generated rule by terraform"
    #   v4_cidr_blocks = ["0.0.0.0/0"]
    #   v6_cidr_blocks = ["::/0"]
    #   port = "-1"
    # }
  ]
}

variable "ipv6_dualstack" {
  type    = bool
  default = false
}

variable "self" {
  type = bool
  default = false
}