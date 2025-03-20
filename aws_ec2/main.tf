resource "aws_instance" "module" {
  for_each = { for i in var.instances : i.name => i }

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = file("./bootstrap/${var.user_data}")
  key_name               = aws_key_pair.module[each.key].id

  associate_public_ip_address = each.value.associate_public_ip_address

  iam_instance_profile = local.state_allow_aws_efs ? aws_iam_instance_profile.efs_access_instance_profile[0].name : null

  dynamic "credit_specification" {
    for_each = each.value.cpu_credits != "" ? [each.value.cpu_credits] : []
    content {
      cpu_credits = credit_specification.value
    }
  }

  metadata_options {
    http_tokens                 = "required"
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
  }

  root_block_device {
    volume_size = each.value.volume_size
    volume_type = each.value.volume_type
  }

  tags = {
    Name = "${var.env}-${each.key}"
  }
}

resource "aws_key_pair" "module" {
  for_each   = { for i in var.instances : i.name => i }
  key_name   = "key-for-${var.env}-${each.key}-ec2"
  public_key = var.public_key
}