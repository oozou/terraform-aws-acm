variable "acms_domain_name" {
  description = "Domain name for request certificate."
  type        = any
  default     = {}
}

variable "route53_zone_name" {
  description = "Hosted zone name matches with domain name certificate."
  type        = string
}
