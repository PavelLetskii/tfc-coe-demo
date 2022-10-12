locals {
  alb = {
    healthy_host_count = {
      name = "CPU load is high on a Linux VM"
      thresholds = {
        critical = 0
      }

      comparison_operator = "LessThanOrEqualToThreshold"
      dimensions = {
        LoadBalancer = ""
        TargetGroup  = ""
      }

      metric_name        = "HealthyHostCount"
      namespace          = "AWS/ApplicationELB"
      period             = 60
      statistic          = "Average"
      evaluation_periods = "2"
    }
  }
}
