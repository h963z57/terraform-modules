Compute instance YC
============
```tf
module "compute_instance" {
    source = "git@github.com:h963z57/terraform_modules.git//yc_compute_instance"
    //zone = ""
    projectname = "NAME"
    env = "prod"
    allow_stopping_for_update = true
    //platform_id               = ""
    //cores                     = ""
    memory                    = "4"
    core_fraction             = "20"
    //image_id                  = ""
    //disk_size                 = "30"
    //disk_type                 = ""
    //secondary_disk_id          = [""]
    //secondary_disk_auto_delete = false
    //secondary_disk_mode       = "READ_WRITE"
    vpc_id                    = <data.terraform_remote_state...>
    security_group_ids        = <data.terraform_remote_state...>
    vpc_static_address        = <data.terraform_remote_state...>
    //metadata                  = ".ssh/id_ed25519.pub"
    //preemptible               = false
}
```