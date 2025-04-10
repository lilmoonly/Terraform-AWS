# AWS Region
region = "eu-central-1"

# Project naming
project_name = "forgejo"

# VPC settings
vpc_cidr = "10.0.0.0/16"
availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

common_tags = {
  Environment = "dev"
  Owner       = "Bohdan"
}

# EKS Cluster settings
cluster_name    = "forgejo-eks"
cluster_version = "1.29"

# RDS variables:
db_engine_version         = "13.4"
db_instance_class         = "db.t3.micro"
allocated_storage         = 20
db_master_username        = "forgejo"
db_master_password        = "password" 
multi_az                  = false
publicly_accessible       = false
backup_retention_period   = 7
rds_allowed_cidrs         = ["10.0.0.0/16"]
