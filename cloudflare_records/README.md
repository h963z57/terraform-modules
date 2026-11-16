Records module Cloudflare
============

```tf
module "cloudflare" {
  source = "git@github.com:h963z57/terraform-modules.git//cloudflare_records"

  cloudflare_zone_id = var.cloudflare_zone_id

  records = {
    type = "A" #AAAA CNAME

    # For type CNAME only one target
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
      # "a.h963z57.com"
    ]
  }
}
```