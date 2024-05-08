# Enforce Policy with Sentinel and OPA

This repository contains the EC2 instance configuration used to generate mock
data and test an Sentinel and OPA policies.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | >= 3.26.0 |
| random | >= 3.0.1 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| instance\_name | EC2 instance name | `string` | `"Provisioned by Terraform"` | no |
| instance\_type | Type of EC2 instance to provision | `string` | `"t2.micro"` | no |
| region | AWS region | `string` | `"us-west-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_ami | n/a |
| instance\_arn | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
