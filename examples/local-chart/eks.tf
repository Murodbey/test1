locals {
  cluster_version = "1.32"
  ami_name        = "lpl-linux-al2023-eks-$(local.cluster_version)-v0.1.0_9efbba60_20250225_22_51_46"
  namespace       = "exbasic"
}

#Module to create EKS Cluster, Managed node groups, enable Addons and bootstrap cluster with default tooling!
module "eks" {
  source  = "app.terraform.io/lplfinancial-platforms/service-eks/aws"
  version = "3.1.1"

  name            = "ex-helm-basic"
  cluster_version = local.cluster_version
  cluster_type    = "managed"

  deletion_protection = false

  eks_managed_node_groups = [
    {
      name                = "default"
      instance_types      = ["t3.large"]
      min_size            = 3
      max_size            = 10
      desired_size        = 3
      enable_node_auto_repair = true
      lpl_ami_id          = data.aws_ami.eks.id # This should be the LPL-Approved AMI shared within your AWS account
    }
  ]

  enable_logging     = false
  enable_dynatrace   = false
  namespaces = [
    {
      name = local.namespace # keep the namespace name short
      labels = {
        "env" = "dev1"
        "app" = "app-1"
      }
    }
  ]

  create_ingress = false
}