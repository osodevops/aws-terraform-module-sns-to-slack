resource "aws_sns_topic_subscription" "sns_notify_slack" {
  topic_arn = aws_sns_topic.sns_to_slack_topic.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.notify_slack[0].arn
}
