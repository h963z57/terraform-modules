
variable "cloudflare_zone_id" {
  type = string
}

variable "records" {
  type = object({
    type            = string
    targets         = map(string)
    domains         = list(string)
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
    condition = length(distinct(var.records.domains)) == length(var.records.domains)
    error_message = "Domains must be unique."
  }

  validation {
    condition = length(setsubtract(
      toset(var.records.proxied_domains),
      toset(var.records.domains)
    )) == 0

    error_message = "proxied_domains must contain only domains from domains."
  }

  validation {
    condition = (
      var.records.type != "CNAME" ||
      length(var.records.targets) == 1
    )

    error_message = "Only one CNAME target per domain is permitted."
  }
}
