module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.15"

  cluster_name    = var.cluster_name
  cluster_version = "1.30"

  subnet_ids = var.private_subnet_ids
  vpc_id     = var.vpc_id

  cluster_endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {
      instance_types = var.instance_types

      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      capacity_type = "ON_DEMAND"
    }
  }

  tags = var.tags
}