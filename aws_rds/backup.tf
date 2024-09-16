resource "aws_iam_role" "module" {
  count = var.backup_retention_period > 0 ? 1 : 0
  name  = "${var.env}-rds-${var.name}-iam-export-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "rds.amazonaws.com",
        },
        Action    = "sts:AssumeRole",
      },
    ],
  })
}

resource "aws_iam_policy" "module" {
  count = var.backup_retention_period > 0 ? 1 : 0
  name  = "${var.env}-rds-${var.name}-iam-export-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:PutObject",
          "s3:PutObjectAcl",
        ],
        Resource = "arn:aws:s3:::dev-h963z57-delete/*",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "module" {
  count     = var.backup_retention_period > 0 ? 1 : 0
  role      = aws_iam_role.module[0].name
  policy_arn = aws_iam_policy.module[0].arn
}
