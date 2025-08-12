locals {
  cluster_version = "1.28" # Specify your desired EKS version
  region          = "us-east-1" # Specify your desired AWS region
  cluster_name    = "another-example-eks"
  namespace       = "default" # Or your desired namespace
  release_name    = "busybox-release"
}

provider "aws" {
  region = local.region
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = module.eks.token # Assuming your EKS module outputs the token
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = module.eks.token # Assuming your EKS module outputs the token
  }
}

# Example EKS module - Replace with your actual EKS module source and version
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0" # Use an appropriate version

  cluster_name    = local.cluster_name
  cluster_version = local.cluster_version

  vpc_id     = "vpc-xxxxxxxxxxxxxxxxx" # Replace with your VPC ID
  subnet_ids = ["subnet-xxxxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyyyy"] # Replace with your Subnet IDs

  # Add other required EKS module variables here
  # e.g., manage_aws_auth = true, worker_groups or managed_node_groups, etc.
}

# Deploy the Helm chart using the parent module
module "busybox_helm_release" {
  source = "../../"

  description = "test"
  create_helm_release = true
  release_name        = local.release_name
  chart               = "oci://registry-1.docker.io/bitnamicharts/busybox" # Using a public busybox chart as an example
  namespace           = local.namespace
  region              = local.region # Pass the region to the parent module

  values = [
    yamlencode({
      # Define values for the busybox chart
      # This chart might not have a direct 'message' value,
      # so this part is illustrative. You'd need to check
      # the actual chart's values.yaml.
      # For a simple busybox pod, you might configure the command.
      args = ["sh", "-c", "echo 'Hello world' && sleep 3600"]
    })
  ]

  # Pass EKS cluster details to the parent module
  cluster_name                     = module.eks.cluster_name
  cluster_endpoint                 = module.eks.cluster_endpoint
  cluster_certificate_authority_data = module.eks.cluster_certificate_authority_data

  # If your parent module requires other variables, define them here
  # description = "Busybox hello world deployment"
}

# Optional: Output the EKS cluster endpoint
output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = module.eks.cluster_endpoint
}