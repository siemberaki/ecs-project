terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket       = "project-ecs-tf--state"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }

  required_version = ">= 1.10.0"
}

provider "aws" {
  region = "us-east-2"
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}