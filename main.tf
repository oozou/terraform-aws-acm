data "aws_route53_zone" "selected_zone" {
  name         = var.route53_zone_name
  private_zone = false
}

resource "aws_acm_certificate" "this" {
  for_each          = var.acms_domain_name
  domain_name       = lookup(each.value, "domain_name", null)
  validation_method = "DNS"
}

resource "aws_route53_record" "this" {
  for_each = { for dvo in local.domains_validation_options_set_index : dvo[0].domain_name => {
    name   = dvo[0].resource_record_name
    record = dvo[0].resource_record_value
    type   = dvo[0].resource_record_type
  } }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.selected_zone.zone_id
}

resource "aws_acm_certificate_validation" "this" {
  count                   = length(aws_route53_record.this)
  certificate_arn         = local.acm_arn_set_index[count.index]
  validation_record_fqdns = [local.acm_records_set_index[count.index]]
}
