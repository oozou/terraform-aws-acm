data "aws_route53_zone" "selected_zone" {
  name         = var.route53_zone_name
  private_zone = false
}

resource "aws_acm_certificate" "this" {
  for_each                  = var.acms_domain_name
  domain_name               = lookup(each.value, "domain_name", null)
  subject_alternative_names = lookup(each.value, "subject_alternative_names", [])
  validation_method         = "DNS"
  tags                      = local.tags
}


resource "aws_route53_record" "this" {
  for_each = local.domains_validation_options_set

  allow_overwrite = true
  name            = each.value.resource_record_name
  records         = [each.value.resource_record_value]
  ttl             = 60
  type            = each.value.resource_record_type
  zone_id         = data.aws_route53_zone.selected_zone.zone_id

  depends_on = [
    aws_acm_certificate.this
  ]
}

resource "aws_acm_certificate_validation" "this" {
  for_each                = local.domains_validation_options_set
  certificate_arn         = each.value.acm_arn
  validation_record_fqdns = values(aws_route53_record.this)[*].fqdn
  depends_on = [
    aws_route53_record.this
  ]
}
