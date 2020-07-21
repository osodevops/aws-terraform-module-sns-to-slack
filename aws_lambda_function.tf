resource "aws_lambda_function" "notify_slack" {
  filename        = data.archive_file.notify_slack[0].output_path
  description     = "Responsible for sending SNS notifications to Slack."
  function_name   = "${var.environment}-SNS-TO-SLACK-FUNCTION"


  role = aws_iam_role.sns_slack_lambda.arn
  handler = "notify_slack.lambda_handler"
  runtime = "python3.6"
  timeout = 30
  source_code_hash = data.archive_file.notify_slack[0].output_base64sha256


  environment {
    variables = {
      SLACK_WEBHOOK_URL = var.slack_webhook_url
      SLACK_CHANNEL = var.slack_channel
      SLACK_USERNAME = var.slack_username
      SLACK_EMOJI = var.slack_emoji
    }
  }

  lifecycle {
    ignore_changes = [
      "filename",
      "last_modified",
    ]
  }

  tags = merge(var.common_tags,
    map("Name" , "${var.environment}-SLACK-LAMBDA")
  )
}