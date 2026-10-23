
resource "cloudflare_record" "lb" {
  zone_id = var.cloudflare_zone_id
  name    = "info"
  type    = "CNAME"
  value   = var.alb_dns_name
  ttl     = 1
  proxied = false
}
