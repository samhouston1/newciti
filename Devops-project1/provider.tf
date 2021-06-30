terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}


provider "aws" {
  region = var.region
}

# data "terraform_remote_state" "network" {
#   backend = "s3"
#   config = {
#      bucket = "aws-terraform-devops-backend"
#      key    = "network/terraform.tfstate"
#      region = "us-east-1"
#    }
# }

terraform {
  backend "s3" {
    bucket = "rajkpvp1"
    key    = "terraform/state/key"
    region = "us-east-1"
  }
}
