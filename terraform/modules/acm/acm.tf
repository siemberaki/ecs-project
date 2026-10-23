resource "aws_acm_certificate" "ysolom" {
  domain_name       = var.domain_name_acm
  validation_method = var.validation_method

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "cert_valid" {
  for_each = {
    for dvo in aws_acm_certificate.ysolom.domain_validation_options :
    dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id = var.cloudflare_zone_id
  name    = each.value.name
  content = each.value.record
  type    = each.value.type
  ttl     = var.acm_ttl
  proxied = false
}

resource "aws_acm_certificate_validation" "ysolom" {
  certificate_arn = aws_acm_certificate.ysolom.arn

  validation_record_fqdns = [
    for record in cloudflare_record.cert_valid : record.hostname
  ]

  timeouts {
    create = "45m"
  }
}