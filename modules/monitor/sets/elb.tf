locals {
  elb = {
    healthy_host_count = {
      name = "ELB - 0 healthy targets"
      thresholds = {
        critical = 0
        warning  = 0
      }

      comparison_operator = "LessThanOrEqualToThreshold"
      dimensions = {
        LoadBalancer = ""
        TargetGroup  = ""
      }

      metric_name         = "HealthyHostCount"
      namespace           = "AWS/ELB"
      period              = 60
      statistic           = "Maximum"
      datapoints_to_alarm = 3
      evaluation_periods  = 3
    }

    backend_connections_errors = {
      name = "ELB - Unsuccessfull connections to target"
      thresholds = {
        critical = 0
        warning  = 0
      }

      comparison_operator = "GreaterThanThreshold"
      dimensions = {
        LoadBalancer = ""
      }

      metric_name         = "BackendConnectionErrors"
      namespace           = "AWS/ELB"
      period              = 60
      statistic           = "Sum"
      datapoints_to_alarm = 3
      evaluation_periods  = 3
    }

    surge_queue_length = {
      name = "ELB - Connections that are pending routing"
      thresholds = {
        critical = 0
        warning  = 0
      }

      comparison_operator = "GreaterThanThreshold"
      dimensions = {
        LoadBalancer = ""
      }

      metric_name         = "SurgeQueueLength"
      namespace           = "AWS/ELB"
      period              = 60
      statistic           = "Average"
      datapoints_to_alarm = 15
      evaluation_periods  = 15
    }

    spillover_count = {
      name = "ELB - Unsuccessfull connections between ELB and target"
      thresholds = {
        critical = 0
        warning  = 0
      }

      comparison_operator = "GreaterThanThreshold"
      dimensions = {
        LoadBalancer = ""
      }

      metric_name         = "SpilloverCount"
      namespace           = "AWS/ELB"
      period              = 60
      statistic           = "Sum"
      datapoints_to_alarm = 15
      evaluation_periods  = 15
    }

    httpcode_elb_5xx = {
      name = "ELB - HTTP 5XX server error codes originating from ALB"
      thresholds = {
        critical = 0
        warning  = 0
      }

      comparison_operator = "GreaterThanThreshold"
      dimensions = {
        LoadBalancer = ""
      }

      metric_name         = "HTTPCode_ELB_5XX"
      namespace           = "AWS/ELB"
      period              = 60
      statistic           = "Sum"
      datapoints_to_alarm = 5
      evaluation_periods  = 5
    }

    httpcode_backend_5xx = {
      name = "ELB - HTTP 5XX response codes generated by registered instances"
      thresholds = {
        critical = 0
        warning  = 0
      }

      comparison_operator = "GreaterThanThreshold"
      dimensions = {
        LoadBalancer = ""
      }

      metric_name         = "HTTPCode_Backend_5XX"
      namespace           = "AWS/ELB"
      period              = 60
      statistic           = "Sum"
      datapoints_to_alarm = 5
      evaluation_periods  = 5
    }
  }
}
