variable "env" {
  description = "Environment name"
  type        = string
}

variable "prefix" {
  description = "Prefix for bucket names"
  type        = string
}

variable "bucket_names" {
  description = "List of bucket names"
  type        = list(string)
}

variable "region" {
  description = "DigitalOcean Spaces region"
  type        = string
  default     = "fra1"
}

variable "acl" {
  description = "Bucket ACL: private or public-read"
  type        = string
  default     = "private"

  validation {
    condition = contains([
      "private",
      "public-read"
    ], var.acl)

    error_message = "acl must be private or public-read"
  }
}

variable "force_destroy" {
  description = "Delete bucket even if it contains objects"
  type        = bool
  default     = false
}

variable "versioning" {
  description = "Enable bucket versioning"
  type        = bool
  default     = false
}

#
# Current object expiration
#

variable "days_lifecycle_rule_expiration_current_version" {
  description = "Delete current object versions after N days. null disables the rule."
  type        = number
  default     = null

  validation {
    condition = (
      var.days_lifecycle_rule_expiration_current_version == null ||
      var.days_lifecycle_rule_expiration_current_version > 0
    )
    error_message = "Expiration days must be greater than 0."
  }
}

#
# Non-current object expiration
#

variable "days_lifecycle_rule_expiration_noncurrent_version" {
  description = "Delete non-current object versions after N days. null disables the rule."
  type        = number
  default     = null

  validation {
    condition = (
      var.days_lifecycle_rule_expiration_noncurrent_version == null ||
      var.days_lifecycle_rule_expiration_noncurrent_version > 0
    )
    error_message = "Expiration days must be greater than 0."
  }
}

#
# CORS
#

variable "enable_cors" {
  description = "Enable CORS configuration"
  type        = bool
  default     = false
}

variable "cors_allowed_headers" {
  description = "Allowed CORS headers"
  type        = list(string)
  default     = ["*"]
}

variable "cors_allowed_methods" {
  description = "Allowed CORS methods"
  type        = list(string)
  default     = ["GET"]
}

variable "cors_allowed_origins" {
  description = "Allowed CORS origins"
  type        = list(string)
  default     = ["*"]
}

variable "cors_max_age_seconds" {
  description = "CORS preflight cache lifetime"
  type        = number
  default     = 3600
}