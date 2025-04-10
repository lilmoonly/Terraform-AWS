data "aws_caller_identity" "current" {}

// VPC module
module "vpc" {
  source               = "./modules/vpc"
  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  common_tags          = var.common_tags
}

// EKS Admin IAM module
module "eks_admin" {
  source = "./modules/iam"
}

// EKS Cluster module (using the official eks module)
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.15.4"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  # Use the VPC data; here, we assume worker nodes are deployed in private subnets.
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      min_size       = 1
      max_size       = 2
      desired_size   = 1
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
