terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_spaces_bucket" "main" {
  for_each = toset(var.bucket_names)

  name   = "${var.prefix}-${var.env}-${each.value}"
  region = var.region

  acl           = var.acl
  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning
  }

  dynamic "lifecycle_rule" {
    for_each = var.status_lifecycle_rule_expiration_current_version ? [1] : []

    content {
      id      = "Expiration current version"
      prefix  = ""
      enabled = true

      expiration {
        days = var.days_lifecycle_rule_expiration_current_version
      }
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.status_lifecycle_rule_expiration_noncurrent_version ? [1] : []

    content {
      id      = "Expiration noncurrent version"
      prefix  = ""
      enabled = true

      noncurrent_version_expiration {
        days = var.days_lifecycle_rule_expiration_noncurrent_version
      }
    }
  }

  dynamic "cors_rule" {
    for_each = var.enable_cors ? [1] : []

    content {
      allowed_headers = var.cors_allowed_headers
      allowed_methods = var.cors_allowed_methods
      allowed_origins = var.cors_allowed_origins
      max_age_seconds = var.cors_max_age_seconds
    }
  }
}