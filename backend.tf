# backend

terraform {
  required_version = "1.2.8"

  # backend "s3" {
  #   region = "ap-northeast-2"
  #   bucket = "terraform-workshop-seoul"
  #   key    = "opspresso/web.tfstate"
  # }

  backend "remote" {
    organization = "opspresso"
    workspaces {
      name = "web-opspresso"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.35.0"
    }
  }
}

provider "aws" {
  region  = var.region
}

# resource "null_resource" "null" {
# }
