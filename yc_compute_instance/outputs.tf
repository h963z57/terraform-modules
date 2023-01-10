output "internal_ip_address_vm" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
  //alue = var.vpc_static_address
}

output "external_ipv4_address_vm" {
  value = var.vpc_static_address
}