output "vpc_public_network" {
  value = yandex_vpc_network.public.id
}

output "vpc_private_network" {
  value = yandex_vpc_network.private.id
}

output "vpc_public_subnet" {
  value = yandex_vpc_subnet.public[*].id
}

output "vpc_private_subnet" {
  value = yandex_vpc_subnet.private[*].id
}