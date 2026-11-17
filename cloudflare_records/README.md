Records module Cloudflare
============

```tf
module "cloudflare" {
  source = "git@github.com:h963z57/terraform-modules.git//cloudflare_records"

  cloudflare_zone_id = var.cloudflare_zone_id

  records = {
    my_project = {
      type = "CNAME" #only for CNAME

      # For type CNAME only one target
      targets = {
        lb-1 = "example.com" 
        # lb-2 = "192.0.2.20"
      }


      domains = [
        # "a.example.com",
        "b.example.com",
        "c.example.com"
      ]

      proxied_domains = [
        # "a.example.com"
      ]
    },
    my_project = {

      # For type CNAME only one target
      targets = {
        lb-1 = "<ipv4>" 
        lb-2 = "<ipv6>"
      }


      domains = [
        # "a.example.com",
        "b.example.com",
        "c.example.com"
      ]

      proxied_domains = [
        # "a.example.com"
      ]
    }
  }
}
```