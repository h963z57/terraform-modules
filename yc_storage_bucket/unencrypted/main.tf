terraform {

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "null_resource" "command" {
  provisioner "local-exec" {
    command = "mkdir -p bucket_policy && mkdir -p bucket_policy/${var.env} && mkdir -p bucket_policy/${var.env}/${var.bucket_name} && touch bucket_policy/${var.env}/${var.bucket_name}/policy.json"
  }
}

resource "yandex_storage_bucket" "main" {
  bucket                = "${var.prefix}-${var.env}-${var.bucket_name}"
  acl                   = var.acl
  max_size              = var.max_size
  default_storage_class = var.default_storage_class
  force_destroy         = var.force_destroy

  anonymous_access_flags {
    read = var.anonymous_access_flags_read
    list = var.anonymous_access_flags_list
  }

  lifecycle_rule {
    id      = "abortmultiparts"
    prefix  = ""
    enabled = true
    abort_incomplete_multipart_upload_days = 7
  }

  lifecycle_rule {
    id      = "Transition current version to COLD storage"
    prefix  = ""
    enabled = var.status_lifecycle_rule_transition_current_version_to_cold_storage

    transition {
      days = var.days_lifecycle_rule_transition_current_version_to_cold_storage
      storage_class = "COLD"
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
    id      = "Transition noncurrent version to COLD storage"
    prefix  = ""
    enabled = var.status_lifecycle_rule_transition_noncurrent_version_to_cold_storage

    noncurrent_version_transition {
      days = var.days_lifecycle_rule_transition_noncurrent_version_to_cold_storage
      storage_class = "COLD"
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
 
  versioning {
    enabled = var.versioning
  }
  policy = "${file("bucket_policy/${var.env}/${var.bucket_name}/policy.json")}"
  depends_on = [null_resource.command]
}












