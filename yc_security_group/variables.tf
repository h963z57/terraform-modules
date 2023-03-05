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

variable "ingress_rules" {
  type = list(object({
    protocol = string
    description = string
    v4_cidr_blocks = list(string)
    port = number
  }))
  default = [
    {
      protocol = "TCP"
      description = "Auto generated rule by terraform"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port = "-1"
    },
    {
      protocol = "UDP"
      description = "Auto generated rule by terraform"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port = "-1"
    }
  ]
}

variable "egress_rules" {
  type = list(object({
    protocol = string
    description = string
    v4_cidr_blocks = list(string)
    port = number
  }))
  default = [
    {
      protocol = "TCP"
      description = "Auto generated rule by terraform"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port = "-1"
    },
    {
      protocol = "UDP"
      description = "Auto generated rule by terraform"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port = "-1"
    }
  ]
}