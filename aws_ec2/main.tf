resource "aws_instance" "module" {
  count                  = length(var.names)
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = file(var.user_data)
  key_name               = aws_key_pair.module[count.index].id
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
  # cpu_options {
  #   core_count       = var.core_count
  #   threads_per_core = var.threads_per_core
  # }
  tags = {
    Name = var.names[count.index]
  }
}

resource "aws_key_pair" "module" {
  count      = length(var.names)
  key_name   = "key-for-${var.names[count.index]}-ec2"
  public_key = var.public_key
}