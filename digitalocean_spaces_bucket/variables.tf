variable "env" {
  description = "Environment name"
  type        = string
}

variable "prefix" {
  description = "Prefix for bucket name"
  type        = string
}

variable "region" {
  description = "DigitalOcean Spaces region"
  type        = string
  default     = "fra1"
}

variable "bucket" {
  description = "DigitalOcean Spaces buckets configuration"

  type = list(object({
    name          = string
    acl           = optional(string, "private")
    force_destroy = optional(bool, false)
    versioning    = optional(bool, false)

    days_lifecycle_rule_expiration_current_version    = optional(number)
    days_lifecycle_rule_expiration_noncurrent_version = optional(number)

    cors = optional(object({
      allowed_headers = optional(list(string), ["*"])
      allowed_methods = optional(list(string), ["GET"])
      allowed_origins = optional(list(string), ["*"])
      max_age_seconds = optional(number, 3600)
    }))
  }))

  validation {
    condition = alltrue([
      for bucket in var.bucket :
      contains(["private", "public-read"], bucket.acl)
    ])

    error_message = "bucket.acl must be private or public-read."
  }

  validation {
    condition = alltrue([
      for bucket in var.bucket :
      bucket.days_lifecycle_rule_expiration_current_version == null ||
      bucket.days_lifecycle_rule_expiration_current_version > 0
    ])

    error_message = "days_lifecycle_rule_expiration_current_version must be greater than 0."
  }

  validation {
    condition = alltrue([
      for bucket in var.bucket :
      bucket.days_lifecycle_rule_expiration_noncurrent_version == null ||
      bucket.days_lifecycle_rule_expiration_noncurrent_version > 0
    ])

    error_message = "days_lifecycle_rule_expiration_noncurrent_version must be greater than 0."
  }

  validation {
    condition = length(var.bucket) == length(distinct([
      for bucket in var.bucket : bucket.name
    ]))

    error_message = "Bucket names must be unique."
  }
}