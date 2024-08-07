# Changelog

## [2.7.0] - 9-Aug-2024
### Added
- Env support to aws_iam

## [2.6.0] - 4-Aug-2024
### Changed
- Name of aws_ec2. Added to name "${env}"

## [2.5.0] - 28-Jul-2024
### Changed
- Enable IPv6 DigitalOcean by default

## [2.4.3] - 11-Jul-2024
### Changed
- Fix output ipv6 addr aws_ec2
### Added
- Output IPv6 droplet

## [2.4.2] - 07-Jul-2024
### Changed
- Enable IPv6 for droplets by default

## [2.4.1] - 29-Apr-2024
### Added
- AWS_EFS IAM role for EC2

## [2.4.0] - 20-Apr-2024
### Added
- IPv6 dualstack support (aws_sg, aws_vpc) (IPv6 for aws_vpc enabled by default, without subnets)
### Changed
- Terraform fmt

## [2.3.2] - 15-Apr-2024
### Changed
- Add output IPv6 (aws_ec2)

## [2.3.1] - 12-Apr-2024
### Changed
- Revent 2.3.0

## [2.2.0] - 15-Mar-2024
### Added
- aws_eip module

## [2.1.0] - 15-Mar-2024
### Removed
- YC object_storage encrypted\unencrypted

### Added
- YC object_storage universal module