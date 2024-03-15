terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 5.0"
    }
  }
}

resource "aws_eip" "module" {
  for_each = var.instances

  instance = each.value != "" ? each.value : null
  domain   = "vpc"
}