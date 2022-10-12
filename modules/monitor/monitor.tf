module "monitor" {
  for_each = { for m in local.monitors : "${m.app_name}_${m.set}_${m.metric}_${m.level}_${m.target_name}" => m }

  source = "./monitor_wrapper"

  app_name            = each.value.app_name
  set                 = each.value.set
  metric              = each.value.metric
  target              = each.value.target
  target_name         = each.value.target_name
  level               = each.value.level
  app_data            = each.value.app_data
  metric_data         = each.value.metric_data
  threshold_overrides = each.value.threshold_overrides

  sns_arns = try([aws_sns_topic.topic["${each.value.app_name}_${each.value.level}"].arn], [])
}
