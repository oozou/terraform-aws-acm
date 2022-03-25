resource "aws_acm_certificate" "this" {
  for_each          = { for index, domain in var.acm_domain_name : index => domain }
  domain_name       = each.value
  validation_method = "DNS"
}

resource "aws_route53_record" "this" {
  for_each = local.domains_validation_options

  allow_overwrite = true
  name            = each.value.resource_record_name
  records         = [each.value.resource_record_value]
  ttl             = 60
  type            = each.value.resource_record_type
  zone_id         = var.route53_zone_id
}

resource "aws_acm_certificate_validation" "this" {
  count                   = length(aws_route53_record.this)
  certificate_arn         = aws_acm_certificate.this[count.index].arn
  validation_record_fqdns = [aws_route53_record.this[count.index].fqdn]
}
