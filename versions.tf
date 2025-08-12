terraform {
  required_version = ">= 1.6.0, < 2.0.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 5.0.0, < 6.0.0"
        configuration_aliases = [ 
            aws.eks_helm_deployer,
         ],
    }
    helm = {
        source = "hashicorp/helm"
        version = ">= 2.0.0, < 3.0.0"
    }
  }
}