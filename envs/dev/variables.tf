variable "env" {}
variable "cluster_name" {}
variable "kubernetes_version" {}
variable "vpc_cidr" {}
variable "azs" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "node_instance_types" {}
variable "min_size" {}
variable "max_size" {}
variable "desired_size" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}

variable "ssh_allowed_cidr" {
  type = list(string)
}

variable "http_allowed_cidr" {
  type = list(string)
}