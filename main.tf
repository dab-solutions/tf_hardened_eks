data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"

  cluster_version = var.cluster_version
  cluster_name    = var.cluster_name
  vpc_id          = var.create_vpc ? module.vpc[0].vpc_id : var.vpc_id
  subnets         = var.create_vpc ? module.vpc[0].private_subnets : var.vpc_subnets

  cluster_enabled_log_types = var.enable_cluster_logs ? var.cluster_enabled_log_types : []

  node_groups_defaults = {
    ami_type  = var.ami_type
    disk_size = var.disk_size
  }

  node_groups = var.node_groups

  map_roles = var.map_roles
  map_users = var.map_users

  tags = var.cluster_tags
}