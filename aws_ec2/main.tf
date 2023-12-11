resource "aws_instance" "module" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = file(var.user_data)
  key_name               = aws_key_pair.module.id
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
  # cpu_options {
  #   core_count       = var.core_count
  #   threads_per_core = var.threads_per_core
  # }
  tags = {
    Name = var.name
  }
}

resource "aws_key_pair" "module" {
  key_name   = "key-for-${var.name}-ec2"
  public_key = var.public_key
}