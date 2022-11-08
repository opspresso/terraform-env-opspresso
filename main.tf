# main

module "domain" {
  source = "github.com/nalbam/terraform-aws-route53?ref=v0.12.31"

  root_domain = var.domain

  acm_certificate = true
}

# module "www" {
#   source = "github.com/nalbam/terraform-aws-static-web?ref=v0.12.22"
#   region = var.region

#   zone_id         = module.domain.zone_id
#   certificate_arn = module.domain.certificate_arn

#   force_destroy = true

#   domain_name = [
#     format("www.%s", var.domain),
#     var.domain,
#   ]
# }

# module "repo" {
#   source = "github.com/nalbam/terraform-aws-static-web?ref=v0.12.22"
#   region = var.region

#   zone_id         = module.domain.zone_id
#   certificate_arn = module.domain.certificate_arn

#   force_destroy = true

#   domain_name = [
#     format("repo.%s", var.domain),
#   ]
# }
