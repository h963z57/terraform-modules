terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_spaces_bucket" "main" {
  for_each = {
    for bucket in var.bucket :
    bucket.name => bucket
  }

  name   = "${var.prefix}-${var.env}-${each.value.name}"
  region = var.region

  acl           = each.value.acl
  force_destroy = each.value.force_destroy

  versioning {
    enabled = each.value.versioning
  }

  #
  # Always abort incomplete multipart uploads after 7 days
  #

  lifecycle_rule {
    id      = "abort-incomplete-multipart-uploads"
    prefix  = ""
    enabled = true

    abort_incomplete_multipart_upload_days = 7
  }

  #
  # Current version expiration
  #

  dynamic "lifecycle_rule" {
    for_each = (
      each.value.days_lifecycle_rule_expiration_current_version != null
      ? [1]
      : []
    )

    content {
      id      = "expiration-current-version"
      prefix  = ""
      enabled = true

      expiration {
        days = each.value.days_lifecycle_rule_expiration_current_version
      }
    }
  }

  #
  # Non-current version expiration
  #

  dynamic "lifecycle_rule" {
    for_each = (
      each.value.days_lifecycle_rule_expiration_noncurrent_version != null
      ? [1]
      : []
    )

    content {
      id      = "expiration-noncurrent-version"
      prefix  = ""
      enabled = true

      noncurrent_version_expiration {
        days = each.value.days_lifecycle_rule_expiration_noncurrent_version
      }
    }
  }

  #
  # CORS
  #

  dynamic "cors_rule" {
    for_each = each.value.cors != null ? [each.value.cors] : []

    content {
      allowed_headers = cors_rule.value.allowed_headers
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }
}