hcl
variable "region" {
  description = "AWS region for the EKS cluster."
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
  default     = "another-example-eks-cluster"
}

variable "instance_types" {
  description = "List of instance types for the EKS node group."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "min_size" {
  description = "Minimum size of the EKS node group."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size of the EKS node group."
  type        = number
  default     = 3
}

variable "desired_size" {
  description = "Desired size of the EKS node group."
  type        = number
  default     = 2
}