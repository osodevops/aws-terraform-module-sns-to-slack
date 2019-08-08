resource "aws_iam_policy_attachment" "ami_encryption_policy" {
  name       = "SNS-to-Slack-attachment"
  roles      = ["${aws_iam_role.sns_slack_lambda.name}"]
  policy_arn = "${aws_iam_policy.sns_slack_policy.arn}"
}
