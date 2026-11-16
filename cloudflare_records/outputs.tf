output "dns_records" {
  description = "Created Cloudflare DNS records"

  value = {
    for key, record in cloudflare_dns_record.records :
    key => {
      id      = record.id
      name    = record.name
      type    = record.type
      content = record.content
      proxied = record.proxied
    }
  }
}