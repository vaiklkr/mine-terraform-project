module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.23.0"

  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  endpoint_public_access  = true
  endpoint_private_access = false

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    general = {
      name           = "${var.env}-general-ng"
      instance_types = var.node_instance_types

      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size
    }
  }

  tags = {
    Environment = var.env
    Terraform   = "true"
  }
}