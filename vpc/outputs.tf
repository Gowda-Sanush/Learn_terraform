
output "test_vpc_id" {
  description = "ID of the test VPC."
  value       = aws_vpc.test.id
}

output "test_public_subnet_id" {
  description = "ID of the public subnet in ap-south-1a."
  value       = aws_subnet.public_1a.id
}

output "test_private_subnet_id" {
  description = "ID of the private subnet in ap-south-1a."
  value       = aws_subnet.private_1a.id
}

output "test_internet_gateway_id" {
  description = "ID of the Internet Gateway attached to the test VPC."
  value       = aws_internet_gateway.test.id
}

output "test_ec2_instance_id" {
  description = "ID of the public test EC2 instance."
  value       = aws_instance.public_test.id
}

output "test_ec2_public_ip" {
  description = "Public IP address of the test EC2 instance."
  value       = aws_instance.public_test.public_ip
}

output "test_private_ec2_instance_id" {
  description = "ID of the private test EC2 instance."
  value       = aws_instance.private_test.id
}

output "test_private_ec2_private_ip" {
  description = "Private IP address of the private test EC2 instance."
  value       = aws_instance.private_test.private_ip
}
