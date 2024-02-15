output "reserved_ips" {
  value       = { for name, ip in digitalocean_floating_ip.module : name => ip.ip_address }
  description = "Map of reserved IP names to their IP addresses."
}

output "assigned_ips" {
  value = {
    for name, assignment in digitalocean_floating_ip_assignment.module :
    name => assignment.ip_address if assignment.droplet_id != ""
  }
  description = "Map of assigned IP names to their IP addresses."
}