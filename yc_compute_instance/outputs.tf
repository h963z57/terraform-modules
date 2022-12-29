output "internal_ip_address_vm" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "external_ipv4_address_vm" {
  value = yandex_vpc_address.addr.external_ipv4_address.0.address
}