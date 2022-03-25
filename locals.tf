locals {
  domains_validation_options_set_index = { for index, value in aws_acm_certificate.this : index => [for index, value in value.domain_validation_options : value] }
  domains_validation_options           = { for index, value in local.domains_validation_options_set_index : index => value[0] }
}
