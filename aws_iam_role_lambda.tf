resource "aws_iam_role" "sns_slack_lambda" {
  name               = "${var.environment}-SLACK-SNS-ROLE"
  description        = "Allows Lambda function to read SNS notifications and send them to slack."
  assume_role_policy = data.aws_iam_policy_document.lambda_config_trust.json
}
