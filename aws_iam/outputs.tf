output "groups_and_users" {
  value = {
    for g, users in local.formatted_users : g => {
      users = [for u in users : aws_iam_user.module[u].name]
    }
  }
}

output "iam_access_keys" {
  value = { for key, val in aws_iam_access_key.module : key => val.id }
}

output "iam_secret_keys" {
  value = { for key, val in aws_iam_access_key.module : key => val.secret }
  sensitive = true
}