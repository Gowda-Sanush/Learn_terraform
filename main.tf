terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

// terraform block has a plugin details and cloud provider.
// provider is like where exactly you want your resources to be.
// resources are what resources you want to create.
