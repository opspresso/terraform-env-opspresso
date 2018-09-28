# Provider

provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-state-sbl"
    key = "opspresso-web.tfstate"
  }
  required_version = "> 0.11.0"
}
