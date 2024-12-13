resource "aws_instance" "module" {
  for_each               = toset(var.names)
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = file("./bootstrap/${var.user_data}")
  key_name               = aws_key_pair.module[each.key].id

  associate_public_ip_address = var.associate_public_ip_address

  dynamic "credit_specification" {
    for_each = var.cpu_credits != "" ? [var.cpu_credits] : []
    content {
      cpu_credits = credit_specification.value
    }
  }

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = "${var.env}-${each.key}"
  }
}

resource "aws_key_pair" "module" {
  for_each   = toset(var.names)
  key_name   = "key-for-${var.env}-${each.key}-ec2"
  public_key = var.public_key
}