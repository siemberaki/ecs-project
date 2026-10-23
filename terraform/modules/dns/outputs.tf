
output "cloudflare_record_name" {
  description = "Cloudflare DNS record hostname"
  value       = cloudflare_record.lb.hostname
}
