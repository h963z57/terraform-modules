resource "aws_s3_bucket_lifecycle_configuration" "module" {
  bucket = aws_s3_bucket.module.id

  rule {
    id     = "Delete old incomplete multi-part uploads"
    status = "Enabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }

  dynamic "rule" {
    for_each = var.lifecycle_transition_rule
    content {
      id     = rule.value.id
      status = rule.value.status
      filter {
        prefix = rule.value.prefix
      }
      transition {
        days          = rule.value.days
        storage_class = rule.value.storage_class
      }
    }
  }

  dynamic "rule" {
    for_each = var.lifecycle_expiration_rule
    content {
      id     = rule.value.id
      status = rule.value.status
      filter {
        prefix = rule.value.prefix
      }
      expiration {
        days = rule.value.days
      }
    }
  }

  dynamic "rule" {
    for_each = var.lifecycle_noncurrent_transition_rule
    content {
      id     = rule.value.id
      status = rule.value.status
      filter {
        prefix = rule.value.prefix
      }
      noncurrent_version_transition {
        noncurrent_days = rule.value.days
        storage_class   = rule.value.storage_class
      }
    }
  }

  dynamic "rule" {
    for_each = var.lifecycle_noncurrent_expiration_rule
    content {
      id     = rule.value.id
      status = rule.value.status
      filter {
        prefix = rule.value.prefix
      }
      noncurrent_version_expiration {
        noncurrent_days = rule.value.days
      }
    }
  }
}