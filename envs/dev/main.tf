module "vpc" {
  source = "../../modules/vpc"

  env             = var.env
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "ec2" {
  source = "../../modules/ec2"

  env              = var.env
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnets[0]

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  ssh_allowed_cidr  = var.ssh_allowed_cidr
  http_allowed_cidr = var.http_allowed_cidr
  https_allowed_cidr = var.http_allowed_cidr
}


# module "eks" {
#   source = "../../modules/eks"

#   env                   = var.env
#   cluster_name          = var.cluster_name
#   kubernetes_version    = var.kubernetes_version
#   vpc_id                = module.vpc.vpc_id
#   private_subnets       = module.vpc.private_subnets
#   node_instance_types   = var.node_instance_types
#   min_size              = var.min_size
#   max_size              = var.max_size
#   desired_size          = var.desired_size
# }

