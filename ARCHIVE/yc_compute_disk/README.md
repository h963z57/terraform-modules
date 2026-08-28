Compute disk YC
============
```tf
module "compute_disk" {
    source = "git@github.com:h963z57/terraform-modules.git//yc_compute_disk"
    env = "prod"
    disk_name = "NAME"
    //type = "network-hdd"
    size = "10"
    //block_size = "4096"
}
```