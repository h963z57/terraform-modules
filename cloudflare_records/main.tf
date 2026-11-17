terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }
}

locals {
  dns_records_list = flatten([
    for group_name, group in var.records : [
      for pair in setproduct(
        setunion(
          toset(group.domains),
          toset(group.proxied_domains)
        ),
        toset(keys(group.targets))
      ) : {
        key     = "${group_name}/${pair[0]}/${pair[1]}"
        name    = pair[0]
        content = group.targets[pair[1]]

        type = group.type == "CNAME" ? "CNAME" : (
          strcontains(group.targets[pair[1]], ":") ? "AAAA" : "A"
        )

        proxied = contains(group.proxied_domains, pair[0])
        ttl     = group.ttl
      }
    ]
  ])

  dns_records = {
    for record in local.dns_records_list :
    record.key => record
  }
}

resource "cloudflare_dns_record" "records" {
  for_each = local.dns_records

  zone_id = var.cloudflare_zone_id
  name    = each.value.name
  type    = each.value.type
  content = each.value.content
  proxied = each.value.proxied
  ttl     = each.value.ttl
}
