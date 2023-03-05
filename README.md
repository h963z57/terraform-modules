# Terraform Modules

## Do not forget use remote state
        terraform {

          backend "s3" {
            endpoint                    = "storage.yandexcloud.net"
            force_path_style            = true
            access_key                  = ""
            secret_key                  = ""
            bucket                      = ""
            key                         = "prod/personal_project/terraform.tfstate"
            region                      = "ru-central1-a"
            skip_region_validation      = true
            skip_credentials_validation = true
          }

          required_providers {
            yandex = {
              source = "yandex-cloud/yandex"
            }
          }
        }

## VPC module yandex cloud
    module "vpc" {
      source              = "git@github.com:h963z57/terraform_modules.git//yc_network"
      //zone                = ""
      network_name        = "NAME"
      env                 = "prod"
      public_subnet_cidrs = ["10.0.0.0/24"]
      //vpc_static_address  = [""]
    }

## Security group module yandex cloud
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

## Compute instance module yandex cloud
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

## Compute disk module yandex cloud
    module "compute_disk" {
      source = "git@github.com:h963z57/terraform-modules.git//yc_compute_disk"
      env = "prod"
      disk_name = "NAME"
      //type = "network-hdd"
      size = "10"
      //block_size = "4096"
    }

## Object storage module yandex cloud (encrypted)
    module "s3" {
      source                = "git@github.com:h963z57/terraform_modules.git//yc_storage_bucket/encrypted"
      env                   = "prod"
      prefix                = "Username"
      bucket_name           = "Name"
      //acl                   = "private"
      max_size              = "107374182400"
      default_storage_class = "STANDARD" # ICE COLD
      //anonymous_access_flags_read = "false"
      //anonymous_access_flags_list = "false"
      //status_lifecycle_rule_transition_current_version_to_cold_storage    = "false"
      //days_lifecycle_rule_transition_current_version_to_cold_storage      = "360"
      //status_lifecycle_rule_expiration_current_version                    = "false"
      //days_lifecycle_rule_expiration_current_version_to_cold_storage      = "360"
      //status_lifecycle_rule_transition_noncurrent_version_to_cold_storage = "false"
      //days_lifecycle_rule_transition_noncurrent_version_to_cold_storage   = "360"
      //status_lifecycle_rule_expiration_noncurrent_version                 = "false"
      //days_lifecycle_rule_expiration_noncurrent_version_to_cold_storage   = "360"
      //versioning                                                          = false
    }
