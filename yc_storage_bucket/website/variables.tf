variable "env" {
  type    = string
  default = "dev"
}

variable "prefix" {
  type    = string
  default = "8g9fdjv"
}

variable "bucket_name" {
  type    = string
  default = "change-me"
}

variable "acl" {
  type    = string
  default = "public-read"
}

variable "max_size" {
  type    = number
  default = "1048576"
}

variable "default_storage_class" {
  type    = string
  default = "STANDARD" # COLD ICE
}

variable "index_document" {
  type = string
  default = "index.html"
}

variable "error_document" {
  type = string
  default = ""
}

variable "anonymous_access_flags_read" {
  type    = bool
  default = true
}

variable "anonymous_access_flags_list" {
  type    = bool
  default = false
}

variable "status_lifecycle_rule_transition_current_version_to_cold_storage" {
  type = bool
  default = "false"
}

variable "days_lifecycle_rule_transition_current_version_to_cold_storage" {
  type = number
  default = "360"
}

variable "status_lifecycle_rule_expiration_current_version" {
  type = bool
  default = "false"
}

variable "days_lifecycle_rule_expiration_current_version_to_cold_storage" {
  type = number
  default = "360"
}

variable "status_lifecycle_rule_transition_noncurrent_version_to_cold_storage" {
  type = bool
  default = "false"
}

variable "days_lifecycle_rule_transition_noncurrent_version_to_cold_storage" {
  type = number
  default = "360"
}

variable "status_lifecycle_rule_expiration_noncurrent_version" {
  type = bool
  default = "false"
}

variable "days_lifecycle_rule_expiration_noncurrent_version_to_cold_storage" {
  type = number
  default = "360"
}

variable "versioning" {
  type    = bool
  default = false
}