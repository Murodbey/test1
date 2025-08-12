locals {
  namespace          = "exbasic"
  release-name       = "ex-basic-release"
  cluster_version    = "1.32"
  ami_name           = "lpl-linux-al2023-eks-${local.cluster_version}-v0.1.0_9efbba60_20250225_22_51_46"
}

resource "null_resource" "eks_ready" {
  depends_on = [module.eks]
}

module "api_helm_release" {
  source = "../../"
  
  description = test
  cluster_name                     = module.eks.name
  cluster_endpoint                 = module.eks.cluster_endpoint
  cluster_certificate_authority_data = module.eks.cluster_certificate_authority_data
  region                           = data.aws_region.current.name
  release_name                     = local.release-name
  namespace                        = local.namespace
  chart                            = "./charts/example"
}