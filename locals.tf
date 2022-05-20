locals {
  domains_validation_options_set_index = { for index, value in aws_acm_certificate.this : index => [for index, value in value.domain_validation_options : value] }
  acm_arn_set_index                    = [for index, value in aws_acm_certificate.this : value.arn]
  acm_records_set_index                = [for index, value in aws_route53_record.this : value.fqdn]
}
