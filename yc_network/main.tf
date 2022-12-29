terraform {

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone = var.zone
}

#=================== Create public network=================================

resource "yandex_vpc_network" "public" {
  name = "${var.env}-public-${var.network_name}"
}

resource "yandex_vpc_subnet" "public" {
  count          = length(var.public_subnet_cidrs)
  name           = "${var.env}-public-${count.index}"
  zone           = var.zone
  network_id     = yandex_vpc_network.public.id
  v4_cidr_blocks = [element(var.public_subnet_cidrs, count.index)]
}

#=================== Create private network=================================

resource "yandex_vpc_network" "private" {
  name = "${var.env}-private-${var.network_name}"
}

resource "yandex_vpc_subnet" "private" {
  count          = length(var.private_subnet_cidrs)
  name           = "${var.env}-private-${count.index}"
  zone           = var.zone
  network_id     = yandex_vpc_network.private.id
  v4_cidr_blocks = [element(var.private_subnet_cidrs, count.index)]
}
