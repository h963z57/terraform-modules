output "ec2_instances" {
  value = {
    for instance in aws_instance.module :
    instance.id => {
      ec2_id       = instance.id
      name         = replace(instance.tags["Name"], "${var.env}-", "")
      private_ipv4 = instance.private_ip
      public_ipv4  = instance.public_ip
      public_ipv6  = lookup(instance, "ipv6_addresses", null)
    }
  }
}