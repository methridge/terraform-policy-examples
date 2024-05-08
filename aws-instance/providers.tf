###############################################################################
# providers.tf
#
# Contains all provider blocks and configuration.
###############################################################################

provider "aws" {
  region = var.region
}
