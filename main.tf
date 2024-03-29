# main

module "domain" {
  source = "github.com/nalbam/terraform-aws-route53?ref=v0.13.2"

  root_domain = var.domain

  acm_certificate = true
}

module "www" {
  source = "github.com/nalbam/terraform-aws-static-web?ref=v0.13.4"
  region = var.region

  zone_id         = module.domain.zone_id
  certificate_arn = module.domain.certificate_arn

  force_destroy = true

  domain_name = [
    format("www.%s", var.domain),
    var.domain,
  ]
}

module "ghs" {
  source = "github.com/nalbam/terraform-aws-route53-record?ref=v0.13.2"

  zone_id = module.domain.zone_id
  name = [
    format("calendar.%s", var.domain),
    format("mail.%s", var.domain),
  ]
  type = "CNAME"

  records = [
    "ghs.googlehosted.com",
  ]
}
