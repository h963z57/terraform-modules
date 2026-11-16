module "cloudflare" {
  source = "../../../../terraform-modules/cloudflare_records"

  cloudflare_zone_id = var.cloudflare_zone_id

  records = {
    type = "CNAME"

    targets = {
      lb-1 = "example.com"
      # lb-2 = "192.0.2.20"
    }


    domains = [
      # "a.h963z57.com",
      "b.h963z57.com",
      "c.h963z57.com"
    ]

    proxied_domains = [
      "a.h963z57.com"
    ]
  }
}