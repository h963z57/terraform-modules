terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_firewall" "module" {
  name = var.name

  droplet_ids = var.droplet_ids

  dynamic "inbound_rule" {
    for_each = var.allow_ingress_ports_tcp
    content {
      protocol         = "tcp"
      port_range       = inbound_rule.value
      source_addresses = ["0.0.0.0/0"]
    }
  }

  dynamic "inbound_rule" {
    for_each = var.allow_ingress_ports_udp
    content {
      protocol         = "udp"
      port_range       = inbound_rule.value
      source_addresses = ["0.0.0.0/0"]
    }
  }


  dynamic "outbound_rule" {
    for_each = var.allow_egress_ports_tcp
    content {
      protocol              = "tcp"
      port_range            = outbound_rule.value
      destination_addresses = ["0.0.0.0/0"]
    }
  }

  dynamic "outbound_rule" {
    for_each = var.allow_egress_ports_tcp
    content {
      protocol              = "udp"
      port_range            = outbound_rule.value
      destination_addresses = ["0.0.0.0/0"]
    }
  }

  # ================ Advanced ===============
  dynamic "inbound_rule" {
    for_each = var.ingress_rules_advanced
    content {
      protocol         = inbound_rule.value.protocol
      port_range       = inbound_rule.value.port
      source_addresses = inbound_rule.value.v4_cidr_blocks
    }
  }

  dynamic "outbound_rule" {
    for_each = var.egress_rules_advanced
    content {
      protocol              = outbound_rule.value.protocol
      port_range            = outbound_rule.value.port
      destination_addresses = outbound_rule.value.v4_cidr_blocks
    }
  }
}