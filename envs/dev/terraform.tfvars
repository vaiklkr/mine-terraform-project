env                = "dev"
cluster_name       = "dev-eks"
kubernetes_version = "1.32"

vpc_cidr = "10.10.0.0/16"

azs = [
  "ap-south-1a",
  "ap-south-1b"
]

public_subnets = [
  "10.10.1.0/24",
  "10.10.2.0/24"
]

private_subnets = [
  "10.10.11.0/24",
  "10.10.12.0/24"
]

node_instance_types = ["t3.small"]

min_size     = 1
max_size     = 3
desired_size = 2


ami_id        = "ami-01a00762f46d584a1"
instance_type = "t3.small"
key_name      = "new-jenkins-server-key"  # manually create key through aws console and then paste here name

ssh_allowed_cidr = ["152.59.7.145/32"]  # add your ip
http_allowed_cidr = ["0.0.0.0/0"]