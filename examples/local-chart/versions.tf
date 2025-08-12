terraform {
  required_version = ">= 1.6.0, < 2.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.40"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.10"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.20"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
      version = ">= 2.0, < 3.0"
    }
  }
}