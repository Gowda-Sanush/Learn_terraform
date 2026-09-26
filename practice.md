<!-- variables -->

1. Variables
Variables prevent hardcoding values, such as AWS region or SNS topic name.

variables.tf

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "topic_name" {
  type    = string
  default = "infra-monitor-notification"
}

<!-- Use them in your resource: -->
provider "aws" {
  region = var.aws_region
}

resource "aws_sns_topic" "mentor_notifications" {
  name = var.topic_name
}
<!-- You can override a variable when applying: -->
terraform apply -var="topic_name=my-new-topic"

2. Outputs

<!-- Outputs display useful values after terraform apply, such as an SNS topic ARN. -->

output "sns_topic_arn" {
  value = aws_sns_topic.mentor_notifications.arn
}

after apply terraform apply it will print the value of sns_topic_arn in logs.
<!-- you can also view output from below command: -->
terraform output

<!-- 3. State -->

<!-- Terraform stores details of resources it manages in a state file, usually: -->

Your .tf code  ↔  Terraform state  ↔  Actual AWS resources

This lets it determine whether to create, update, or destroy a resource.
Important: state can contain sensitive values. Do not commit terraform.tfstate to Git. For team projects, state is typically stored remotely, for example in an S3 backend.
Useful commands:

terraform state list
terraform state show aws_sns_topic.mentor_notifications

After terraform apply    → state remembers the SNS topic
After terraform destroy  → state removes the SNS topic record

4. Data sources
A data source reads an AWS resource that already exists. Terraform does not create or manage it.

A data source lets Terraform look up something that already exists in AWS.
It does not create it and does not delete it

Example: imagine your company already has an SNS topic created manually in AWS:
company-alerts

data "aws_sns_topic" "existing_topic" {
  name = "company-alerts"
}

output "existing_topic_arn" {
  value = data.aws_sns_topic.existing_topic.arn
}

This means: “Terraform, find this existing SNS topic and tell me about it.”