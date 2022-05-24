locals {
  domains_validation_options_list = flatten([for k, v in aws_acm_certificate.this : [for d in v.domain_validation_options : merge(d, { acm_arn = v.arn, key = k })]])
  domains_validation_options_set  = { for v in local.domains_validation_options_list : v.domain_name => v }
  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags
  )
}
