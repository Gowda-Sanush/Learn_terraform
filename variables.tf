variable "aws_region" {
  description = "AWS region where Terraform will create the SNS topic."
  type        = string
  default     = "ap-south-1"
}

variable "sns_topic_name" {
  description = "Name of the SNS topic to create."
  type        = string
}

variable "environment" {
  description = "Environment tag for the SNS topic."
  type        = string
  default     = "learning"
}

variable "ec2_name" {
  description = "Name tag for the EC2 instance."
  type        = string
  default     = "webserver1"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB."
  type        = number
  default     = 8
}

variable "key_name" {
  description = "Name of an existing EC2 key pair used for SSH access."
  type        = string
}

variable "ssh_cidr" {
  description = "Your public IP address in CIDR form, for example 203.0.113.10/32."
  type        = string
}

variable "ami_id" {
  description = "Full Ubuntu AMI ID available in var.aws_region, for example ami-0123456789abcdef0."
  type        = string
}
