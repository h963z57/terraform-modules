terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }
}

locals {
  dns_records = {
    for pair in setproduct(
      var.records.domains,
      sort(keys(var.records.targets))
    ) :
    "${pair[0]}/${pair[1]}" => {
      name       = pair[0]
      target_key = pair[1]
      content    = var.records.targets[pair[1]]

      proxied = contains(
        var.records.proxied_domains,
        pair[0]
      )
    }
  }
}

resource "cloudflare_dns_record" "records" {
  for_each = local.dns_records

  zone_id = var.cloudflare_zone_id

  name    = each.value.name
  type    = var.records.type
  content = each.value.content

  proxied = each.value.proxied
  ttl     = var.records.ttl

  lifecycle {
    precondition {
      condition = (
        var.records.type != "CNAME" ||
        length(var.records.targets) == 1
      )

      error_message = "Multiple CNAME targets for the same domain are not supported. Use Cloudflare Load Balancing or A/AAAA records."
    }
  }
}
