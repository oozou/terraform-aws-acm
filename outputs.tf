output "certificate_arns" {
  value       = { for index, value in aws_acm_certificate.this : index => value.arn }
  description = "Certificate ARNs"
}
