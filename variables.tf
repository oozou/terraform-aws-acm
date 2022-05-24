variable "acms_domain_name" {
  description = "Domain name for request certificate."
  type        = map(any)
  default     = {}
}

variable "route53_zone_name" {
  description = "Hosted zone name matches with domain name certificate."
  type        = string
}

variable "tags" {
  description = "Tag for a resource that create by this component"
  type        = map(string)
  default     = {}
}
