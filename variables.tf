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
