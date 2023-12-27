SG YC
============

```tf
module "security_group_for_docker_engine" {
    source                  = "git@github.com:h963z57/terraform_modules.git//yc_security_group"
    //zone                    = ""
    env                     = "prod"
    projectname             = "NAME"
    network                 = <data.terraform_remote_state...>
    allow_ingress_ports_tcp =  ["-1"]
    //allow_egress_ports      = ["-1"]
    //ingress_rules_advanced = [
    //  {protocol = "TCP", description = "Auto generated rule by terraform (advanced mode)", v4_cidr_blocks = ["0.0.0.0/0"], port = "-1"},
    //  {protocol = "UDP", description = "Auto generated rule by terraform (advanced mode)", v4_cidr_blocks = ["0.0.0.0/0"], port = "-1"}
    //]
    //egress_rules_advanced = [
    //  {protocol = "TCP", description = "Auto generated rule by terraform (advanced mode)", v4_cidr_blocks = ["0.0.0.0/0"], port = "-1"},
    //  {protocol = "UDP", description = "Auto generated rule by terraform (advanced mode)", v4_cidr_blocks = ["0.0.0.0/0"], port = "-1"}
    //]
}
```