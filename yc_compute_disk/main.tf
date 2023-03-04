terraform {

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_disk" "main" {
  name       = "${var.env}-${var.disk_name}"
  type       = var.type
  zone       = var.zone
  size       = var.size
  block_size = "4096" # 4 8 16 32 64 128
}