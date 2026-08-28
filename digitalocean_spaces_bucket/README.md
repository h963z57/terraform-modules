Spaces bucket DigitalOcean
============
```tf
module "spaces_bucket" {
  source = "git@github.com:h963z57/terraform-modules.git//digitalocean_spaces_bucket"

  env    = "prod"
  prefix = "username"
  region = "fra1"

  bucket = [
    {
      name = "name"

      # acl           = "private"
      # force_destroy = false
      # versioning    = false

      # days_lifecycle_rule_expiration_current_version    = 360
      # days_lifecycle_rule_expiration_noncurrent_version = 360

      # cors = {
      #   allowed_headers = ["*"]
      #   allowed_methods = ["GET"]
      #   allowed_origins = [
      #     "https://example.com"
      #   ]
      #   max_age_seconds = 3600
      # }
    },
    {
      name = "name-2-if-need"

      # versioning = true

      # days_lifecycle_rule_expiration_noncurrent_version = 90
    }
  ]
}
```