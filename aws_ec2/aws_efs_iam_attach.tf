data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  state_allow_aws_efs = length(var.allow_aws_efs) > 0
}

resource "aws_iam_role" "efs_access_role" {
  count = local.state_allow_aws_efs ? 1 : 0
  name  = "${var.env}-${var.name}-efs-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "efs_access_policy" {
  count       = local.state_allow_aws_efs ? 1 : 0
  name        = "${var.env}-${var.name}-efs-access-policy"
  description = "Policy allowing access to EFS"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      for efs_id in var.allow_aws_efs : {
        Effect = "Allow",
        Action = [
          "elasticfilesystem:DescribeAccessPoints",
          "elasticfilesystem:DescribeFileSystems",
          "elasticfilesystem:DescribeMountTargets"
        ],
        Resource = "arn:aws:elasticfilesystem:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:file-system/${efs_id}"
      }
    ]
  })
}

resource "aws_iam_policy" "ec2_describe_availability_zones" {
  count       = local.state_allow_aws_efs ? 1 : 0
  name        = "${var.env}-${var.name}-ec2-describe-availability-zones"
  description = "Policy allowing access to AWS AZ"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = "ec2:DescribeAvailabilityZones",
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "efs_access_role_attachment" {
  count      = local.state_allow_aws_efs ? 1 : 0
  role       = aws_iam_role.efs_access_role[0].name
  policy_arn = aws_iam_policy.efs_access_policy[0].arn
}

resource "aws_iam_role_policy_attachment" "ec2_describe_availability_zones" {
  count      = local.state_allow_aws_efs ? 1 : 0
  role       = aws_iam_role.efs_access_role[0].name
  policy_arn = aws_iam_policy.ec2_describe_availability_zones[0].arn
}

resource "aws_iam_instance_profile" "efs_access_instance_profile" {
  count = local.state_allow_aws_efs ? 1 : 0
  name  = "${var.env}-${var.name}-efs-access-instance-profile"
  role  = aws_iam_role.efs_access_role[0].name
}