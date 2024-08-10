terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 5.0"
    }
  }
}

resource "aws_iam_user" "module" {
  name = "${var.env}-${var.ses-smtp-user}"
}

resource "aws_iam_access_key" "module" {
  count = length(var.ses_keys)
  user  = aws_iam_user.module.name
}

resource "aws_ses_domain_identity" "module" {
  count  = length(var.domains)
  domain = var.domains[count.index]
}

resource "aws_ses_domain_dkim" "module" {
  count  = length(var.domains)
  domain = aws_ses_domain_identity.module[count.index].domain
}

resource "aws_iam_user_policy" "module" {
  name = "${var.env}-ses-smtp-user-policy"
  user = aws_iam_user.module.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ses:SendRawEmail",
        ],
        Resource = "*"
      },
    ]
  })
}