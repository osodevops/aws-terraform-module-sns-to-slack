output "this_slack_topic_arn" {
  description = "The ARN of the SNS topic from which messages will be sent to Slack"
  value       = "${aws_sns_topic.sns_to_slack_topic.arn}"
}

output "lambda_iam_role_arn" {
  description = "The ARN of the IAM role used by Lambda function"
  value       = "${element(concat(aws_iam_role.sns_slack_lambda.*.arn, list("")), 0)}"
}

output "notify_slack_lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = "${element(concat(aws_lambda_function.notify_slack.*.arn, list("")), 0)}"
}

