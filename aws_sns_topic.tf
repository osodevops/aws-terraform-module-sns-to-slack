resource "aws_sns_topic" "sns_to_slack_topic" {
  name  = var.sns_topic_name
  tags  = var.common_tags
}