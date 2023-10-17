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
}

# resource "aws_s3_bucket_acl" "module" {
#   bucket = aws_s3_bucket.module.id
#   acl    = var.acl
# }

resource "aws_s3_bucket_versioning" "module" {
  bucket = aws_s3_bucket.module.id
  versioning_configuration {
    status = var.versioning
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  count  = var.status_bucket_policy ? 1 : 0
  bucket = aws_s3_bucket.module.id
  policy = file("bucket_policy/${var.env}/${var.bucket_name}/policy.json")
}

resource "aws_kms_key" "module" {
  count                   = var.status_bucket_encryption ? 1 : 0
  description             = "Key for ${var.prefix}-${var.env}-${var.bucket_name} bucket"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "module" {
  bucket = aws_s3_bucket.module.id
  count  = var.status_bucket_encryption ? 1 : 0
  rule {
    apply_server_side_encryption_by_default {

      kms_master_key_id = aws_kms_key.module[0].arn
      sse_algorithm     = var.sse_algorithm
    }
  }
}


