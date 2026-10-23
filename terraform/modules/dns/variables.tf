terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID for siema.fyi"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name of the AWS Application Load Balancer."
  type        = string
}
