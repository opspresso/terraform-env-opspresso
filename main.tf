# Terraform Main

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
