terraform {

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

#====================== Create compute instance ==================================

resource "yandex_compute_instance" "vm-1" {
  name                      = "${var.env}-${var.projectname}"
  allow_stopping_for_update = var.allow_stopping_for_update
  platform_id               = var.platform_id
  zone                      = var.zone

  resources {
    cores         = var.cores
    memory        = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.disk_size
      type     = var.disk_type
    }
  }

  dynamic "secondary_disk" {
    for_each = var.secondary_disk_id
    content {
      disk_id = secondary_disk.value
      auto_delete = var.secondary_disk_auto_delete
      mode = var.secondary_disk_mode
    }
  }

  network_interface {
    subnet_id          = var.vpc_id
    nat                = true
    nat_ip_address     = var.vpc_static_address
    security_group_ids = [var.security_group_ids]
  }

  metadata = {
    //ssh-keys = "debian:${file(".ssh/id_ed25519.pub")}"
    ssh-keys = "debian:${file(var.metadata)}"
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

}