env = "dev"

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
  "10.10.3.0/24",
  "10.10.4.0/24"
]

ami_id        = "ami-01a00762f46d584a1"
instance_type = "t3.small"
key_name      = "new-jenkins-server-key"

ssh_allowed_cidr = ["152.59.7.123/32"]
http_allowed_cidr = ["0.0.0.0/0"]
https_allowed_cidr = ["0.0.0.0/0"]