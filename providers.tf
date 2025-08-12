provider "aws" {
  region = var.region
}

provider "aws" {
  alias = "eks-helm-deployer"
  region = var.region
  assume_role {
    role_arn = one(data.aws_iam_roles.eks_helm_deploy.arns)
    session_name = "terraform-aws-service-eks-helm-deploy"
  }
}

provider "helm" {
  kubernetes {
    host = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_certificate_authority_data)
    token = data.aws_eks_cluster_auth.this.token
  }
}