terraform {

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_vpc_security_group" "main" {
  name        = "${var.env}-security group for ${var.projectname}"
  description = ""
  network_id  = var.network
  
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      protocol       = ingress.value.protocol
      description    = ingress.value.description
      v4_cidr_blocks = ingress.value.v4_cidr_blocks
      port           = ingress.value.port
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      protocol       = egress.value.protocol
      description    = egress.value.description
      v4_cidr_blocks = egress.value.v4_cidr_blocks
      port           = egress.value.port
    }
  }
}
