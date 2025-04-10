output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "eks_admin_role_arn" {
  description = "ARN of the EKS admin IAM role (forwarded from module)."
  value       = module.iam.eks_admin_role_arn
}

output "eks_admin_policy_arn" {
  description = "ARN of the EKS admin IAM policy (forwarded from module)."
  value       = module.iam.eks_admin_policy_arn
}

