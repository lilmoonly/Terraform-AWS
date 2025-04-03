output "vpc_id" {
  value = module.vpc.vpc_id
  description = "ID of the VPC"
}

output "public_subnets" {
  value = module.vpc.public_subnets
  description = "List of public subnets"
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
  description = "ID of the private subnet"
}
