variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type    = string
  default = "1.29"
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "eks_managed_node_groups" {
  type = any
}

variable "tags" {
  type    = map(string)
  default = {}
}
variable "aws_auth_roles" {
  description = "List of roles to add to aws-auth configmap"
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

