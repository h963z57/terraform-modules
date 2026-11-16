
variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "records" {
  description = "Cloudflare DNS records configuration"

  type = object({
    type            = string
    targets         = map(string)
    domains         = optional(list(string), [])
    proxied_domains = optional(list(string), [])
    ttl             = optional(number, 1)
  })

  validation {
    condition     = contains(["A", "AAAA", "CNAME"], var.records.type)
    error_message = "Supported types: A, AAAA, CNAME."
  }

  validation {
    condition     = length(var.records.targets) > 0
    error_message = "At least one target is required."
  }

  validation {
    condition = length(
      setintersection(
        toset(var.records.domains),
        toset(var.records.proxied_domains)
      )
    ) == 0

    error_message = "domains and proxied_domains must not contain the same domain."
  }

  validation {
    condition = (
      var.records.type != "CNAME" ||
      length(var.records.targets) == 1
    )

    error_message = "Multiple CNAME targets for the same domain are not supported."
  }
}
