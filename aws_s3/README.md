S3 module AWS
============

```tf
    module "s3" {
      source                = "git@github.com:h963z57/terraform_modules.git//aws_s3"
      env                   = "prod"
      prefix                = "Username"
      bucket_name           = "Name"
      //acl                   = "private"
      //status_bucket_encryption = false
      //sse_algorithm       = "aws:kms"
      //force_destroy         = false
      //status_bucket_policy = false
      //lifecycle_transition_rule = [
        # {
        #   id = "Example transition rule"
        #   status = "Disabled"
        #   days = "7"
        #   storage_class = "GLACIER"
        #   prefix = ""
        # }
      ]
      //lifecycle_expiration_rule = [
        # {
        #   id = "Example expiration rule"
        #   status = "Disabled"
        #   days = "7"
        #   prefix = ""
        # }
      ]
      //lifecycle_noncurrent_transition_rule = [
        # {
        #   id = "Example noncurrent transition rule"
        #   status = "Disabled"
        #   days = "7"
        #   storage_class = "GLACIER"
        #   prefix = ""
        # }
      ]
      //lifecycle_noncurrent_expiration_rule = [
        # {
        #   id = "Example noncurrent expiration rule"
        #   status = "Disabled"
        #   days = "7"
        #   prefix = ""
        # }
      ]
      //versioning = false
    }
```