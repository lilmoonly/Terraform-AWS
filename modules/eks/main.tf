module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.3"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  enable_irsa = true

  eks_managed_node_groups = var.eks_managed_node_groups

  manage_aws_auth_configmap = true
  aws_auth_roles            = var.aws_auth_roles

  tags = var.tags
}
