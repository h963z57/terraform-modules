variable "env" {
  type    = string
  default = "test"
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
  default = "private"
}

variable "status_bucket_encryption" {
  type    = bool
  default = false
}

variable "sse_algorithm" {
  type    = string
  default = "aws:kms"
}

# variable "max_size" {
#   type    = number
#   default = "1048576"
# }

# variable "default_storage_class" {
#   type    = string
#   default = "STANDARD" # COLD ICE
# }

variable "force_destroy" {
  type    = bool
  default = false
}

# variable "anonymous_access_flags_read" {
#   type    = bool
#   default = false
# }

# variable "anonymous_access_flags_list" {
#   type    = bool
#   default = false
# }

variable "status_bucket_policy" {
  type    = bool
  default = false
}

variable "lifecycle_transition_rule" {
  type = list(object({
    id            = string
    status        = string
    days          = number
    storage_class = string
    prefix        = string
  }))
  default = [
    # {
    #   id = "Example transition rule"
    #   status = "Disabled"
    #   days = "7"
    #   storage_class = "GLACIER"
    #   prefix = ""
    # }
  ]
}

variable "lifecycle_expiration_rule" {
  type = list(object({
    id     = string
    status = string
    days   = number
    prefix = string
  }))
  default = [
    # {
    #   id = "Example expiration rule"
    #   status = "Disabled"
    #   days = "7"
    #   prefix = ""
    # }
  ]
}

variable "lifecycle_noncurrent_transition_rule" {
  type = list(object({
    id            = string
    status        = string
    days          = number
    storage_class = string
    prefix        = string
  }))
  default = [
    # {
    #   id = "Example noncurrent transition rule"
    #   status = "Disabled"
    #   days = "7"
    #   storage_class = "GLACIER"
    #   prefix = ""
    # }
  ]
}

variable "lifecycle_noncurrent_expiration_rule" {
  type = list(object({
    id     = string
    status = string
    days   = number
    prefix = string
  }))
  default = [
    # {
    #   id = "Example noncurrent expiration rule"
    #   status = "Disabled"
    #   days = "7"
    #   prefix = ""
    # }
  ]
}

variable "versioning" {
  type    = string
  default = "Disabled"
}