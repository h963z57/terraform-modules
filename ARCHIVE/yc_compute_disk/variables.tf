variable "env" {
  type    = string
  default = "dev"
}

variable "disk_name" {
  type    = string
  default = "change-me"
}

variable "type" {
  type    = string
  default = "network-hdd" # network-ssd
}

variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "size" {
  type    = number
  default = "16"
}

variable "block_size" {
  type    = number
  default = "4096"
}