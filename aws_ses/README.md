SES module aws
===========
Creates ebs and attach to ec2 instance if need

```tf
module "aws_ses" {
  source = "git@github.com:h963z57/terraform-modules.git//aws_ses"
  source  = "../../../../../terraform-modules/aws_ses"
  domains = ["example.com"]
  # ses-smtp-user = "ses-smtp-user"
  # ses_keys = ["main"]
}
```