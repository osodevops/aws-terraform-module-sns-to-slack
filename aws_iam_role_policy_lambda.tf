resource "aws_iam_policy" "sns_slack_policy" {
  name        = "${upper(var.environment)}-SNS-SLACK-LAMBDA-POLICY"
  path        = "/"
  description = "SNS notification to slack."

  policy = "${data.aws_iam_policy_document.lambda_config_policy.json}"
}
