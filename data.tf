# This reads the SNS topic created by the resource above. It does not manage it.
data "aws_sns_topic" "topic_lookup" {
  name = aws_sns_topic.mentor_notifications.name
}
