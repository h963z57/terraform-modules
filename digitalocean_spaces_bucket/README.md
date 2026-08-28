Spaces bucket DigitalOcean
============
```tf
module "spaces_bucket" {
    source = "git@github.com:h963z57/terraform-modules.git//digitalocean_spaces_bucket"
    env          = "prod"
    prefix       = "username"
    bucket_names = [
        "name",
        "name-2-if-need"
    ]

    region = "fra1"

    # acl           = "private"
    # force_destroy = false

    # versioning = false

    # days_lifecycle_rule_expiration_current_version   = 360
    # days_lifecycle_rule_expiration_noncurrent_version   = 360
    
    # enable_cors = false
    # cors_allowed_headers = ["*"]
    # cors_allowed_methods = ["GET"]
    # cors_allowed_origins = [
    #   "https://example.com"
    # ]
    # cors_max_age_seconds = 3600
}
```