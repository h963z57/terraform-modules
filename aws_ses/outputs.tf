locals {
  aws_ses_domain_map_txt_record = {
    for item in flatten([
      for idx in range(length(var.domains)) : [
        for pair in setproduct([var.domains[idx]], [aws_ses_domain_identity.module[idx].verification_token]) : {
          domain             = pair[0],
          verification_token = pair[1]
        }
      ]
    ]) :
    "${item.domain}__${item.verification_token}" => item
  }

  aws_ses_domain_map_chame_record = {
    for item in flatten([
      for idx in range(length(var.domains)) : [
        for pair in setproduct([var.domains[idx]], aws_ses_domain_dkim.module[idx].dkim_tokens) : {
          domain     = pair[0],
          dkim_token = pair[1]
        }
      ]
    ]) :
    "${item.domain}__${item.dkim_token}" => item
  }

}

output "ses_smtp_user_access_key_id" {
  value = aws_iam_access_key.module[*].id
}

output "ses_smtp_user_secret_access_key" {
  value     = aws_iam_access_key.module[*].secret
  sensitive = true
}

output "ses_smtp_ses_smtp_password_v4" {
  value     = aws_iam_access_key.module[*].ses_smtp_password_v4
  sensitive = true
}

output "aws_ses_domain_identity_ids" {
  value = aws_ses_domain_identity.module[*].id
}

output "aws_ses_domain_identity_verification_tokens" {
  value = local.aws_ses_domain_map_txt_record
}

output "aws_ses_dkmm_tokens" {
  value = local.aws_ses_domain_map_chame_record
}