terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 5.0"
    }
  }
}

locals {
  formatted_users = {
    for group, users in var.groups_with_users : group => [
      for user in users : "${group}_${user}"
    ]
  }
    formatted_user_group_pairs = flatten([
    for g, users in local.formatted_users : [
      for u in users : {
        group = g
        user  = u
      }
    ]
  ])
    policy_group_pairs = flatten([
    for policy, groups in var.policies : [
      for group in groups : {
        policy = policy
        group  = group
      }
    ]
  ])
}

resource "aws_iam_group" "module" {
  for_each = local.formatted_users
  name     = each.key
}

resource "aws_iam_user" "module" {
  for_each = toset(flatten(values(local.formatted_users)))
  name     = each.value
  depends_on = [aws_iam_group.module]
}

resource "aws_iam_user_group_membership" "module" {
  for_each = { for pair in local.formatted_user_group_pairs : "${pair.group}:${pair.user}" => pair }

  user   = each.value.user
  groups = [each.value.group]
  depends_on = [aws_iam_group.module, aws_iam_user.module]
}

resource "aws_iam_access_key" "module" {
  for_each = var.security_credentials
  user     = each.key
}

resource "aws_iam_policy" "module" {
  for_each = var.policies
  name     = each.key
  policy   = file("./policies/${each.key}.json")
}

resource "aws_iam_group_policy_attachment" "module" {
  for_each = { for pair in local.policy_group_pairs : "${pair.policy}:${pair.group}" => pair }

  policy_arn = aws_iam_policy.module[each.value.policy].arn
  group      = each.value.group
}