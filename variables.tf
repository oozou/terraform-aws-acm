variable "acms_domain_name" {
  description = "Domain name for request certificate."
  type        = map(any)
  default     = {}
}

variable "route53_zone_name" {
  description = "Hosted zone name matches with domain name certificate."
  type        = string
  default     = null
}

variable "is_automatic_verify_acms" {
  description = "Whether to automatically verify all acm domain on route53."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tag for a resource that create by this component"
  type        = map(string)
  default     = {}
}
