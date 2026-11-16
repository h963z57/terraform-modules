
variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "records" {
  description = "Cloudflare DNS record groups"

  type = map(object({
    type            = string
    targets         = map(string)
    domains         = optional(list(string), [])
    proxied_domains = optional(list(string), [])
    ttl             = optional(number, 1)
  }))

  validation {
    condition = alltrue([
      for r in values(var.records) :
      contains(["A", "AAAA", "CNAME"], r.type)
    ])
    error_message = "Supported types: A, AAAA, CNAME."
  }

  validation {
    condition = alltrue([
      for r in values(var.records) :
      length(r.targets) > 0
    ])
    error_message = "Every record group must have at least one target."
  }

  validation {
    condition = alltrue([
      for r in values(var.records) :
      length(setintersection(
        toset(r.domains),
        toset(r.proxied_domains)
      )) == 0
    ])
    error_message = "domains and proxied_domains must not overlap."
  }

  validation {
    condition = alltrue([
      for r in values(var.records) :
      r.type != "CNAME" || length(r.targets) == 1
    ])
    error_message = "CNAME groups must contain exactly one target."
  }
}
