data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "webserver_ssh" {
  name        = "test-ec2-ssh"
  description = "Allow testing between the public and private EC2 instances"
  vpc_id      = aws_vpc.test.id

  dynamic "ingress" {
    for_each = var.ssh_cidr == null ? [] : [var.ssh_cidr]

    content {
      description = "SSH from my public IP"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  ingress {
    description = "All traffic between the test instances"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test-ec2-ssh"
  }
}

resource "aws_instance" "public_test" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_1a.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.webserver_ssh.id]

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.ec2_name}-public"
  }
}

resource "aws_instance" "private_test" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_1a.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.webserver_ssh.id]

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.ec2_name}-private"
  }
}
