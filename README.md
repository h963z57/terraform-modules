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
      source = "git@github.com:h963z57/terraform_modules.git//yc_network"
      //zone = ""
      network_name = "personal_projects"
      env = "prod"
      public_subnet_cidrs = ["10.0.0.0/24"]
      vpc_static_address = ["default"]
    }

## Security group module yandex cloud
    module "security_group_for_docker_engine" {
      source = "git@github.com:h963z57/terraform_modules.git//yc_security_group"
      //zone = ""
      env = "prod"
      projectname = "docker_engine"
      network = module.vpc.vpc_public_network
      allow_ingress_ports_tcp =  ["-1"]
      allow_ingress_ports_udp =  ["-1"]
      //allow_egress_ports = ["-1"]
    }

## Compute instance module yandex cloud
    module "compute_instance" {
      source = "git@github.com:h963z57/terraform_modules.git//yc_compute_instance"
      //zone = ""
      projectname = "docker-engine"
      env = "prod"
      allow_stopping_for_update = true
      //platform_id = ""
      //cores = ""
      memory = "4"
      core_fraction = "20"
      //image_id = ""
      //disk_size = "30"
      //disk_type = ""
      vpc_id = module.vpc.vpc_public_subnet[0]
      security_group_ids = module.security_group_for_docker_engine.security_group_id
      vpc_static_address = <data.terraform_remote_state...>
    }

## Object storage module yandex cloud
    module "s3" {
      source = "git@github.com:h963z57/terraform_modules.git//yc_storage_bucket"
      env = "prod"
      prefix = "Username"
      bucket_name = "Name"
      //acl = "private"
      max_size = "107374182400"
      default_storage_class = "ICE"
      //status_lifecycle_rule_transition_current_version_to_cold_storage = "false"
      //days_lifecycle_rule_transition_current_version_to_cold_storage = "360"
      //status_lifecycle_rule_expiration_current_version = "false"
      //days_lifecycle_rule_expiration_current_version_to_cold_storage = "360"
      //status_lifecycle_rule_transition_noncurrent_version_to_cold_storage = "false"
      //days_lifecycle_rule_transition_noncurrent_version_to_cold_storage = "360"
      //status_lifecycle_rule_expiration_noncurrent_version = "false"
      //days_lifecycle_rule_expiration_noncurrent_version_to_cold_storage = "360"
      //versioning = false
    }
