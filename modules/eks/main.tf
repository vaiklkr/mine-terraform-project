module "vpc" {
  source = "../../modules/vpc"

  name = "staging-vpc"

  cidr = var.vpc_cidr

  azs = [
    "ap-south-1a",
    "ap-south-1b"
  ]

  private_subnets = [
    "10.20.1.0/24",
    "10.20.2.0/24"
  ]

  public_subnets = [
    "10.20.101.0/24",
    "10.20.102.0/24"
  ]

  tags = {
    Environment = "staging"
  }
}

module "eks" {
  source = "../../modules/eks"

  cluster_name = "staging-eks"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets

  instance_types = ["t3.large"]

  min_size     = 2
  max_size     = 4
  desired_size = 2

  tags = {
    Environment = "staging"
  }
}