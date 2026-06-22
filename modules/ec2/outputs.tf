output "instance_id" {
  value = aws_instance.id
}

output "public_ip" {
  value = aws_instance.public_ip
}

output "security_group_id" {
  value = aws_security_group.ec2_sg.id
}