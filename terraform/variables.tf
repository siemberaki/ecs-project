variable "cloudflare_api_token" {
  description = "Cloudflare API token for managing DNS"
  type        = string
  sensitive   = true
}
variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID for siema.fyi"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "public_subnet" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for the public subnets."
  type        = list(string)
}

variable "destination_cidr" {
  description = "The destination CIDR block for the public route."
  type        = string
}

variable "http" {
  description = "HTTP port."
  type        = number
}

variable "https" {
  description = "HTTPS port."
  type        = number
}

variable "protocol" {
  description = "Protocol for the security group."
  type        = string
}

variable "ecs_task_execution_role" {
  description = "ARN of the ECS task execution role."
  type        = string
}

variable "ecs_task_role_policy_arn" {
  description = "ARN of the ECS task role policy."
  type        = string
}

variable "year_version" {
  description = "Version of the policy."
  type        = string
}

variable "policy_action" {
  description = "Action for the IAM policy."
  type        = string
}

variable "policy_effect" {
  description = "Effect for the IAM policy."
  type        = string
}

variable "policy_principal" {
  description = "Principal for the IAM policy."
  type        = string
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster."
  type        = string
}

variable "domain_name" {
  description = "Base domain name."
  type        = string
}

variable "domain_name_acm" {
  description = "Domain name for the ACM certificate."
  type        = string
}

variable "validation_method" {
  description = "Validation method for the ACM certificate."
  type        = string
}

variable "acm_ttl" {
  description = "TTL for the ACM certificate validation record."
  type        = number
}

variable "lb_type" {
  description = "Type of the load balancer."
  type        = string
}

variable "ssl_policy" {
  description = "SSL policy for the ALB listener."
  type        = string
}

variable "http_port" {
  description = "HTTP port for the ALB."
  type        = number
}

variable "https_port" {
  description = "HTTPS port for the ALB."
  type        = number
}
variable "target_group_port" {
  description = "Port used by the ALB to reach the ECS container."
  type        = number
}

variable "http_protocol" {
  description = "HTTP protocol for the ALB."
  type        = string
}

variable "https_protocol" {
  description = "HTTPS protocol for the ALB."
  type        = string
}

variable "tcp" {
  description = "TCP protocol for the ALB security group."
  type        = string
}

variable "allow_cidr" {
  description = "CIDR blocks allowed for ALB security group."
  type        = list(string)
}

variable "target_type" {
  description = "Target type for the ALB target group."
  type        = string
}

variable "ecr_uri" {
  description = "The URI of the ECS image."
  type        = string
}

variable "app_dname" {
  description = "Domain name for the application."
  type        = string
}

variable "ecs_cpu" {
  description = "CPU units for the ECS task."
  type        = number
}

variable "ecs_memory" {
  description = "Memory in MiB for the ECS task."
  type        = number
}

variable "ecs_sg" {
  description = "Name of the security group."
  type        = string
}

variable "route53_record_ns_name" {
  description = "Name for the DNS record."
  type        = string
}

variable "route53_record_type" {
  description = "Type for the DNS record."
  type        = string
}