###############################################################################
# terraform.tf
#
# Contains a single terraform block which defines your required_version and
# required_providers.
###############################################################################

terraform {
  required_version = "~> 1.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.26.0"
    }
  }
}
