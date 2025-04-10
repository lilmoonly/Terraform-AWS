data "aws_caller_identity" "current" {}

module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  region       = var.region
}

module "eks_admin" {
  source = "./modules/iam"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.15.3"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets


  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      min_size     = 1
      max_size     = 2
      desired_size = 1
      instance_types = ["t2.micro"]
    }
  }

  manage_aws_auth_configmap = true
  
  aws_auth_roles = [
    {
      rolearn  = module.eks_admin.eks_admin_role_arn
      username = "eks-admin"
      groups   = ["system:masters"]
    }
  ]
}  
 
  
