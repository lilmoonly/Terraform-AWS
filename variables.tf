variable "region" {
  type        = string
  description = "AWS region to deploy to"
  default     = "eu-central-1"
}

variable "project_name" {
  type        = string
  description = "Project name prefix"
  default     = "forgejo"
}

variable "cluster_name" {
  default = "forgejo-eks"
}

variable "cluster_version" {
  default = "1.29"
}

variable "eks_managed_node_groups" {
  description = "Map of EKS managed node group configurations"
  type = map(object({
    instance_types = list(string)
    desired_size   = number
    min_size       = number
    max_size       = number
  }))
}
