output "eip_addresses" {
  value = { for key, eip in aws_eip.module : key => eip.public_ip }
}