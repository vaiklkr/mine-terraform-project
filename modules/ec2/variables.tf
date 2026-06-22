variable "env" {}
variable "vpc_id" {}
variable "public_subnet_id" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}

variable "ssh_allowed_cidr" {
    type = list(string)  
}

variable "http_allowed_cidr" {
    type = list(string)
  
}

variable "https_allowed_cidr" {
    type = list(string)
  
}
