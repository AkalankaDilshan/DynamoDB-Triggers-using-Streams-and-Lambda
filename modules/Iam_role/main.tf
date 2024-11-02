#create Iam role policy data
data "aws_iam_policy_document" "polices" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:PutMetricFilter",
      "logs:PutRetentionPolicy"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "sns:Publish"
    ]
    resources = "arn:aws:sns:*:*:*"
  }

  statement {

  }
}

# Create data for IAM role 
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }
  }
}

#Create Iam Role
resource "aws_iam_role" "function_role" {
  name               = "function_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

}
#Create Iam Role Police Documentation
resource "aws_iam_policy" "policy-document" {
  name   = "tf-policy-document"
  policy = data.aws_iam_policy_document.polices.json
}

# Attach the policy to the IAM role
resource "aws_iam_policy_attachment" "role_policy_attachment" {
  name       = "Police Attachement"
  roles      = [aws_iam_role.function_role.name]
  policy_arn = aws_iam_policy.policy-document.arn
}

