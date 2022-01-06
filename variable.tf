variable "cluster_name" {
  
}

variable "cluster_version" {
    default = "1.20"
}

variable "eks_managed_nodes" {
  type = bool
  default = true
}

variable "self_managed_nodes" {
  type = bool
  default = false
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = []
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = []
}

variable "node_groups" {
    default = {
        example = {
            desired_capacity = 1
            max_capacity     = 10
            min_capacity     = 1

            instance_types = ["t3.large"]
            capacity_type  = "SPOT"
            update_config = {
                max_unavailable_percentage = 50 # or set `max_unavailable`
            }
        }
    }
}

variable "ami_type" {
    default = "AL2_x86_64"
}

variable "disk_size" {
    default = 50
}

variable "cluster_tags" {
    default = {}
}

variable "enable_cluster_logs" {
  default = false
}

variable "cluster_enabled_log_types" {
  default = ["api", "audit", "scheduler"]
}

#### Networking
variable "create_vpc" {
    type = bool
    default = true
}

variable "vpc_id" {
  default = "REPLACE_THIS"
}

variable "vpc_subnets" {
  default = []
}

variable "vpc_cidr" {
    type = string
    description = "(optional) describe your variable"
    default = "10.0.0.0/16"
}

variable "private_subnets" {
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
    default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "vpc_tags" {
    default = {}
}

variable "enable_nat_gateway" {
    default = true
}

variable "single_nat_gateway" {
    default = true
  
}

variable "enable_dns_hostnames" {
    default = true
  
}