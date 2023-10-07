terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 5.0"
    }
  }
}

resource "aws_s3_bucket" "module" {
  bucket        = "${var.prefix}-${var.env}-${var.bucket_name}"
  force_destroy = var.force_destroy

  lifecycle_rule {
    id      = "abortmultiparts"
    prefix  = ""
    enabled = true
    abort_incomplete_multipart_upload_days = 7
  }

  lifecycle_rule {
    id      = "Transition current version to GLACIER storage"
    prefix  = ""
    enabled = var.status_lifecycle_rule_transition_current_version_to_cold_storage

    transition {
      days = var.days_lifecycle_rule_transition_current_version_to_cold_storage
      storage_class = "GLACIER"
    } 
  }

  lifecycle_rule {
    id      = "Expiration current version"
    prefix  = ""
    enabled = var.status_lifecycle_rule_expiration_current_version

    expiration  {
      days = var.days_lifecycle_rule_expiration_current_version_to_cold_storage
    } 
  }
 
  lifecycle_rule {
    id      = "Transition noncurrent version to GLACIER storage"
    prefix  = ""
    enabled = var.status_lifecycle_rule_transition_noncurrent_version_to_cold_storage

    noncurrent_version_transition {
      days = var.days_lifecycle_rule_transition_noncurrent_version_to_cold_storage
      storage_class = "GLACIER"
    }
  }
  
  lifecycle_rule {
    id      = "Expiration noncurrent version"
    prefix  = ""
    enabled = var.status_lifecycle_rule_expiration_noncurrent_version

    noncurrent_version_expiration {
      days = var.days_lifecycle_rule_expiration_noncurrent_version_to_cold_storage
    }
  }
}

# resource "aws_s3_bucket_lifecycle_configuration" "module" {
#   bucket = aws_s3_bucket.module.id

# }


resource "aws_s3_bucket_acl" "module" {
  bucket = aws_s3_bucket.module.id
  acl    = var.acl
}

