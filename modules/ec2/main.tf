resource "aws_security_group" "ec2_sg" {
    name = "${var.env}.ec2-sg"
    description = "security group for ${var.env} EC2"
    vpc_id = var.vpc_id

    ingress {
        description = "SSH from any 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.ssh_allowed_cidr
    }

    ingress {
        description = "HTTP allow"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = var.http_allowed_cidr
    }

    ingress {
        description = "HTTPS allow"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = var.https_allowed_cidr
    }
    egress {
        description = "allow all outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.env}-ec2-sg"
        Environment = var.env
    }
    
}
resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name        = "${var.env}-ec2"
    Environment = var.env
  }
}