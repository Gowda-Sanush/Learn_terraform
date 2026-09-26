// Since terraform loads all tf as one confgiguration , keep providera and terraform part only once.

resource "aws_sns_topic" "mentor_notifications" {
  name = var.sns_topic_name

  tags = {
    Name        = var.sns_topic_name
    Environment = var.environment
    Owner       = "sanush"
  }
}

// terraform fmt - Automatically formats your .tf files into Terraform’s standard style. It changes
// terraform plan -target=aws_sns_topic.mentor_notifications
// terraform apply -target=aws_sns_topic.mentor_notifications

// where exactly the i need to define the terraform output?
