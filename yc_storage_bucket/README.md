## Object storage module yandex cloud
```tf  
module "s3" {
  source                = "git@github.com:h963z57/terraform_modules.git//yc_storage_bucket"
  env                   = "prod"
  prefix                = "Username"
  bucket_name           = ["name", "name-2-if-need"]
  //acl                   = "private"
  max_size              = "107374182400"
  default_storage_class = "STANDARD" # ICE COLD
  //force_destroy         = false
  //anonymous_access_flags_read = "false"
  //anonymous_access_flags_list = "false"
  //status_lifecycle_rule_transition_current_version_to_cold_storage    = "false"
  //days_lifecycle_rule_transition_current_version_to_cold_storage      = "360"
  //status_lifecycle_rule_expiration_current_version                    = "false"
  //days_lifecycle_rule_expiration_current_version_to_cold_storage      = "360"
  //status_lifecycle_rule_transition_noncurrent_version_to_cold_storage = "false"
  //days_lifecycle_rule_transition_noncurrent_version_to_cold_storage   = "360"
  //status_lifecycle_rule_expiration_noncurrent_version                 = "false"
  //days_lifecycle_rule_expiration_noncurrent_version_to_cold_storage   = "360"
  //versioning                                                          = false
  //encrypt                                                             = false
}
```

## Object storage module yandex cloud (website)
```tf
module "s3" {
  source                = "git@github.com:h963z57/terraform_modules.git//yc_storage_bucket/website"
  env                   = "prod"
  prefix                = "Username"
  bucket_name           = ["name", "name-2-if-need"]
  //acl                   = "public-read"
  max_size              = "107374182400"
  default_storage_class = "STANDARD" # ICE COLD
  //force_destroy         = false
  //index_document        = "index.html"
  //error_document        = ""
  //anonymous_access_flags_read = "true"
  //anonymous_access_flags_list = "false"
  //status_lifecycle_rule_transition_current_version_to_cold_storage    = "false"
  //days_lifecycle_rule_transition_current_version_to_cold_storage      = "360"
  //status_lifecycle_rule_expiration_current_version                    = "false"
  //days_lifecycle_rule_expiration_current_version_to_cold_storage      = "360"
  //status_lifecycle_rule_transition_noncurrent_version_to_cold_storage = "false"
  //days_lifecycle_rule_transition_noncurrent_version_to_cold_storage   = "360"
  //status_lifecycle_rule_expiration_noncurrent_version                 = "false"
  //days_lifecycle_rule_expiration_noncurrent_version_to_cold_storage   = "360"
  //versioning                                                          = false
}
```