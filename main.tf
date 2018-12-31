# Terraform Main

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-state-sbl"
    key = "opspresso-web.tfstate"
  }
  required_version = "> 0.11.0"
}

provider "aws" {
  region = "${var.region}"
}

module "domain" {
  source = "git::https://github.com/nalbam/terraform-aws-route53.git"
  domain = "${var.domain}"
}

module "www" {
  source = "git::https://github.com/nalbam/terraform-aws-static-web.git"
  region = "${var.region}"

  zone_id = "${module.domain.zone_id}"
  certificate_arn = "${module.domain.certificate_arn}"

  domain_name = [
    "www.${var.domain}",
    "${var.domain}"
  ]
}

module "repo" {
  source = "git::https://github.com/nalbam/terraform-aws-static-web.git"
  region = "${var.region}"

  zone_id = "${module.domain.zone_id}"
  certificate_arn = "${module.domain.certificate_arn}"

  domain_name = [
    "repo.${var.domain}"
  ]
}

output "www" {
  value = "https://www.${var.domain}"
}

output "repo" {
  value = "https://repo.${var.domain}"
}
