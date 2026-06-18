env = "dev"
cluster_name = "dev-eks"
kubernetes_version = "1.35"
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
min_size = 1
max_size = 3
desired_size = 2