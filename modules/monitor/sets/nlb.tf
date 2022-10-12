locals {
  nlb = {
    healthy_host_count = {
      name = "NLB - 0 healthy targets"
      thresholds = {
        critical = 0
      }

      comparison_operator = "LessThanOrEqualToThreshold"
      dimensions = {
        LoadBalancer = ""
        TargetGroup  = ""
      }

      metric_name         = "HealthyHostCount"
      namespace           = "AWS/NetworkELB"
      period              = 60
      statistic           = "Maximum"
      datapoints_to_alarm = 3
      evaluation_periods  = 3
    }
  }
}
