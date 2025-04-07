module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  region       = var.region
}

module "eks_admin" {
  source = "./modules/iam"
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      min_size       = 1
      max_size       = 3
      instance_types = ["t3.medium"]
    }
  }
  
  aws_auth_roles = [
  {
    rolearn  = "arn:aws:iam::733573665725:role/eks-admin-role"
    username = "eks-admin"
    groups   = ["system:masters"]
  }
]
 
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
