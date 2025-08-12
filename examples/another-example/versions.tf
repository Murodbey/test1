terraform {
  required_version = ">= 1.6.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40, < 6.0" # Adjust version range based on EKS module needs and parent module
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.10, < 3.0" # Adjust version range based on parent module
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.20, < 3.0" # Required for Helm provider exec configuration
    }
  }
}