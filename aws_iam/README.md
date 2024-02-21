IAM module aws
===========

```tf
module "aws_iam" {
  source = "git@github.com:h963z57/terraform-modules.git//aws_iam"
    groups_with_users = {
        "group_name1" = ["user_name1", "user_name2"], # user name will be group_name1_user_name1
        "group_name2" = ["user_name1", "user_name2"],
    }
    security_credentials = {
        "group_name1_user_name1" = "discription",
    }
    policies = {
        "PolicyFileName" = ["group_name1", "group_name2"], # file must be ./policies/PolicyFileName.json
    }
}
```