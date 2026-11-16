terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }
}

locals {
  all_domains = setunion(
    toset(var.records.domains),
    toset(var.records.proxied_domains)
  )

  dns_records = {
    for pair in setproduct(
      local.all_domains,
      toset(keys(var.records.targets))
    ) :
    "${pair[0]}/${pair[1]}" => {
      name    = pair[0]
      content = var.records.targets[pair[1]]

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
}
