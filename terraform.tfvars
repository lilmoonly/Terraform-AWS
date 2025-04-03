region       = "eu-central-1"
project_name = "forgejo"

eks_managed_node_groups = {
  default = {
    instance_types = ["t3.micro"]
    desired_size   = 1
    min_size       = 1
    max_size       = 1
  }
}
