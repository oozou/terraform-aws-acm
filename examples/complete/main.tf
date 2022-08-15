module "acm_singapore" {
  source = "./module/acm"
  providers = {
    aws = aws.singapore
  }
  acms_domain_name = {
    argocd = {
      domain_name = "argocd.aws.oozou.com"
    }
  }
  route53_zone_name        = "aws.oozou.com"
  is_automatic_verify_acms = true
}