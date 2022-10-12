resource "aws_cloudwatch_metric_alarm" "monitor" {
  alarm_name = "[${local.level_string}] [${local.app.application_name}] [${local.app.environment}] [${var.target_name}] ${local.data.name}"

  dimensions = length(local.monitor_dimensions) > 0 ? local.monitor_dimensions : null
  threshold  = local.threshold

  comparison_operator = lookup(local.data, "comparison_operator", "GreaterThanOrEqualToThreshold")
  evaluation_periods  = lookup(local.data, "evaluation_periods", 1)
  datapoints_to_alarm = lookup(local.data, "datapoints_to_alarm", 1)
  metric_name         = lookup(local.data, "metric_name", null)
  namespace           = lookup(local.data, "namespace", null)
  period              = lookup(local.data, "period", null)
  statistic           = lookup(local.data, "statistic", null)
  treat_missing_data  = lookup(local.data, "treat_missing_data", "missing")
  actions_enabled     = lookup(local.data, "actions_enabled", true)
  unit                = lookup(local.data, "unit", null)
  tags                = lookup(local.data, "tags", {})

  alarm_actions             = var.sns_arns
  ok_actions                = var.sns_arns
  insufficient_data_actions = var.sns_arns

  dynamic "metric_query" {
    for_each = local.metric_query
    content {
      id          = metric_query.key
      expression  = lookup(metric_query.value, "expression", null)
      label       = lookup(metric_query.value, "label", null)
      return_data = lookup(metric_query.value, "return_data", false)

      dynamic "metric" {
        for_each = can(index(keys(metric_query.value), "metric")) ? [metric_query.value.metric] : []
        content {
          metric_name = metric.value.metric_name
          namespace   = metric.value.namespace
          period      = metric.value.period
          stat        = metric.value.stat

          dimensions = lookup(metric.value, "dimensions", {})
          unit       = lookup(metric.value, "unit", null)
        }
      }
    }
  }
}
