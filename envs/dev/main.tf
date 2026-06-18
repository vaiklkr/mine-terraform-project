module "vpc" {
    source = "../../modules/vpc"
    env = var.env
    vpc_cidr = var.vpc_cidr
    azs = var.azs
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
}

module "eks" {
    source = "../../modules/eks"

    env = var.env
    cluster_name = var.cluster_name
    kubernetes_version = var.kubernetes_version
    vpc_id = module.vpc.vpc_id
    private_subnets = module.vpc.private_subnets
    node_instance_types = var.node_instance_types
    max_size = var.max_size
    min_size = var.min_size
    desired_size = var.desired_size
}
