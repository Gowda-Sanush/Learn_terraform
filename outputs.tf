output "created_sns_topic_arn" {
  description = "ARN returned by the SNS topic resource Terraform manages."
  value       = aws_sns_topic.mentor_notifications.arn
}


output "looked_up_sns_topic_name" {
  description = "Name of the look up SNS name"
  value       = data.aws_sns_topic.topic_lookup.name
}

output "looked_up_sns_topic_arn" {
  description = "The same ARN, read back through the SNS data source."
  value       = data.aws_sns_topic.topic_lookup.arn
}

output "ec2_instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.app.id
}

output "ec2_public_ip" {
  description = "Public IPv4 address of the EC2 instance."
  value       = aws_instance.app.public_ip
}

output "ec2_ami_id" {
  description = "AMI ID selected for the EC2 instance."
  value       = aws_instance.app.ami
}

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
