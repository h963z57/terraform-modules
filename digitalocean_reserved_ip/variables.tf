variable "region" {
  type    = string
  default = ""
}

variable "reserved_ips" {
  description = "Map of reserved IP names to droplet IDs"
  type        = map(string)
  default = {
    # "reserved_ip_1" = "droplet_id"
  }
}
