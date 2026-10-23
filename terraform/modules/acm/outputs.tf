
output "acm_cert_arn" {
  description = "ARN of the validated ACM certificate"
  value       = aws_acm_certificate_validation.ysolom.certificate_arn
}
