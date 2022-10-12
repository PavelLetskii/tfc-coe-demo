resource "aws_sns_topic" "topic" {
  for_each = { for i in local.integrations : "${i.appname}_${i.type}" => i }

  name = "${each.value.appname}_${each.value.name}_${each.value.type}"

  policy = <<POLICY
{
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Action": [
        "SNS:GetTopicAttributes",
        "SNS:SetTopicAttributes",
        "SNS:AddPermission",
        "SNS:RemovePermission",
        "SNS:DeleteTopic",
        "SNS:Subscribe",
        "SNS:ListSubscriptionsByTopic",
        "SNS:Publish",
        "SNS:Receive"
      ],
      "Condition": {
        "StringEquals": {
          "AWS:SourceOwner": "${data.aws_caller_identity.current.account_id}"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Resource": "arn:aws:sns:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${each.value.appname}_${each.value.name}_${each.value.type}",
      "Sid": "__default_statement_ID"
    }
  ],
  "Version": "2008-10-17"
}
POLICY
}

resource "aws_sns_topic_subscription" "sub" {
  for_each = { for i in local.integrations : "${i.appname}_${i.type}_pagerduty" => i }

  endpoint               = "https://events.pagerduty.com/integration/${each.value.key}/enqueue"
  protocol               = "https"
  endpoint_auto_confirms = true
  topic_arn              = aws_sns_topic.topic["${each.value.appname}_${each.value.type}"].arn
}

