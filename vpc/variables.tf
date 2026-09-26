variable "ec2_name" {
  description = "Base name for the EC2 instances."
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
  description = "Optional name of an existing EC2 key pair for SSH access."
  type        = string
  default     = null
}

variable "ssh_cidr" {
  description = "Optional public IP CIDR allowed to SSH to the public instance."
  type        = string
  default     = null
}
