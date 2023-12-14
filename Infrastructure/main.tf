terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# NETWORK MODULE SECTION

module "Network" {
  source = "./NETWORK"
}

# EFS MODULE SECTION
module "EFS" {
source = "./EFS"
target_subnet = module.Network.private_subnet_ids
}