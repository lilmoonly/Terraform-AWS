output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID of the VPC"
}

output "public_subnets" {
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
    aws_subnet.public_c.id
  ]
  description = "List of public subnets"
}

output "private_subnets" {
  value = [
    aws_subnet.private_a.id
  ]
  description = "List of private subnets"
}
