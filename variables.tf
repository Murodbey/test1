variable "cluster_name" {
  type = string
}

variable "cluster_endpoint" {
  type = string
}

variable "cluster_certificate_authority_data" {
  type = string
}

variable "create_helm_release" {
  type = bool
  default = true
}

variable "release_name" {
  type = string
}

variable "chart" {
  type = string
}

variable "namespace" {
  type = string
}

variable "region" {
  type = string

  validation {
    condition = var.region == "us-east-1" || var.region == "us-east-2"
    error_message = "Region mus be us-east-1 or us-east-2"
  }
}

variable "description" {
  type = string
}

variable "repository" {
  type = string
  default = null
}

variable "repository_ca_file" {
  type = string
}