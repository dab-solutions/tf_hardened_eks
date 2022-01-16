provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  #version         = "18.0.1"
  version = " 17.24.0"

  cluster_version = var.cluster_version
  cluster_name    = var.cluster_name
  vpc_id          = var.create_vpc ? module.vpc[0].vpc_id : var.vpc_id
  #subnet_ids      = var.create_vpc ? module.vpc[0].private_subnets : var.vpc_subnets
  subnets      = var.create_vpc ? module.vpc[0].private_subnets : var.vpc_subnets


  cluster_enabled_log_types = var.enable_cluster_logs ? var.cluster_enabled_log_types : []

  #self_managed_node_group_defaults = var.self_managed_nodes ? {
  #  ami_type  = var.ami_type
  #  disk_size = var.disk_size
  #} : {}

  #eks_managed_node_group_defaults = var.eks_managed_nodes ? {
  #  ami_type  = var.ami_type
  #  disk_size = var.disk_size
  #} : {}

  node_groups_defaults = {
    ami_type  = var.ami_type
    disk_size = var.disk_size
  }
  node_groups = var.node_groups

  #self_managed_node_groups = var.self_managed_nodes ? var.node_groups : {}

  #eks_managed_node_groups = var.eks_managed_nodes ? var.node_groups : {}

  map_roles = var.map_roles
  map_users = var.map_users

  tags = var.cluster_tags
}