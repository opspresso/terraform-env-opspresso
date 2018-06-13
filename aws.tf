# Provider

provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-state-bespin-sbl-seoul"
    key = "www.tfstate"
  }
}
