data "aws_iam_roles" "eks_helm_deploy" {
    name_regex = "eks-helm-deploy"
    path_prefix = "/folder/cloudops/"
}

data "aws_eks_cluster_auth" "this" {
    provider = aws.eks_helm_deployer
    name = var.cluster
}