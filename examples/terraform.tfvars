cluster_name = "test-my-iac"
cluster_tags = {
  environment = "development"
}

node_groups = {
  group-1 = {
    desired_capacity = 7
    max_capacity     = 7
    min_capacity     = 5
    instance_types   = ["m5.large"]
    disk_size        = 100
  },
  group-2 = {
    desired_capacity = 6
    max_capacity     = 7
    min_capacity     = 6
    disk_size        = 100
    instance_types   = ["t3.xlarge"]
  },
  group-3 = {
    desired_capacity = 1
    max_capacity     = 2
    min_capacity     = 1
    disk_size        = 100
    instance_types   = ["t3.xlarge"]
  }
}