variable "acm_domain_name" {
  description = "Domain name for request certificate."
  type        = list(string)
}

variable "route53_zone_id" {
  description = "Hosted zone ID matches with domain name certificate."
  type        = string
}
