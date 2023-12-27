# Terraform Modules

## Do not forget use remote state

### YC (need terraform 1.6.5 and higher)
#### Environments
```bash
export AWS_ACCESS_KEY_ID=<access_key>
export AWS_SECRET_ACCESS_KEY=<secret_key>

export YC_STORAGE_ACCESS_KEY=<access_key>
export YC_STORAGE_SECRET_KEY=<secret_key>

# Before export configure yc cli
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)

```
```tf
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "<bucket-name>"
    region = "ru-central1"
    key    = "<path/to/terraform.tfstate>"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true 
    skip_s3_checksum            = true

  }
}

data "terraform_remote_state" "remote_state" {
  backend = "s3"
  config = {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "<bucket-name>"
    region = "ru-central1"
    key    = "<path/to/terraform.tfstate>"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true 
    skip_s3_checksum            = true 
  }
}
```

### AWS

#### Environments
```bash
export AWS_ACCESS_KEY_ID=<access_key>
export AWS_SECRET_ACCESS_KEY=<secret_key>
```

```tf
terraform {
  backend "s3" {
    bucket = "<bucket-name>"
    key    = "<path/to/terraform.tfstate>"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "<bucket-name>"
    key    = "<path/to/terraform.tfstate>"
    region = "eu-central-1"
  }
}
```