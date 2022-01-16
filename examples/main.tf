module "eks" {
    source = "github.com/dab-solutions/tf_hardened_eks.git"

    cluster_name = var.cluster_name
    node_groups = var.node_groups
}