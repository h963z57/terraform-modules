variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "projectname" {
  type    = string
  default = "change-me"
}

variable "env" {
  type    = string
  default = "dev"
}

#--------------------- Instance params ---------------------#
variable "allow_stopping_for_update" {
  type    = bool
  default = "false"
}

variable "platform_id" {
  type    = string
  default = "standard-v3"
}

variable "cores" {
  type    = number
  default = "2"
}

variable "memory" {
  type    = number
  default = "2"
}

variable "core_fraction" {
  type    = number
  default = "20"
}

#--------------------- Disk params (CAUTION)-----------------#
variable "image_id" {
  type    = string
  default = "fd8n4itj8j3nl9tmth9b"
}

variable "disk_size" {
  type    = number
  default = "16"
}

variable "disk_type" {
  type    = string
  default = "network-hdd"
}

variable "secondary_disk_id" {
  type    = list(string)
  default = []
}

variable "secondary_disk_auto_delete" {
  type    = bool
  default = false
}

variable "secondary_disk_mode" {
  type    = string
  default = "READ_WRITE"
}

#--------------------- Network params -----------------------#
variable "vpc_id" {
  type    = string
  default = ""
}

variable "security_group_ids" {
  type = string
  //default = ""
}

variable "vpc_static_address" {
  type    = string
  default = ""
}

variable "metadata" {
  type    = string
  default = ".ssh/id_ed25519.pub"
}

variable "preemptible" {
  type    = bool
  default = false
}