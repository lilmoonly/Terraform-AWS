region       = "eu-central-1"
project_name = "forgejo"

eks_managed_node_groups = {
  default = {
    desired_size = 1
    max_size     = 2
    min_size     = 1

    instance_types = ["t3.micro"]
  }
}

