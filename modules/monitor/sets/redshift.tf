locals {
  redshift = {
    cpu = {
      name = "Redshift - high CPUUtilization"
      thresholds = {
        critical = 90
        warning  = 75
      }

      dimensions = {
        ClusterIdentifier = ""
      }

      metric_name         = "CPUUtilization"
      namespace           = "AWS/Redshift"
      period              = 300
      statistic           = "Average"
      datapoints_to_alarm = 3
      evaluation_periods  = 3
    }

    healthstatus = {
      name = "Redshift - unhealthy"
      thresholds = {
        critical = 1
        warning  = 1
      }

      comparison_operator = "LessThanThreshold"
      dimensions = {
        ClusterIdentifier = ""
      }

      metric_name         = "HealthStatus"
      namespace           = "AWS/Redshift"
      period              = 60
      statistic           = "Maximum"
      datapoints_to_alarm = 2
      evaluation_periods  = 2
    }

    disk_space_used = {
      name = "Redshift - high disk space usage"
      thresholds = {
        critical = 90
        warning  = 80
      }

      dimensions = {
        ClusterIdentifier = ""
      }

      metric_name         = "PercentageDiskSpaceUsed"
      namespace           = "AWS/Redshift"
      period              = 300
      statistic           = "Average"
      datapoints_to_alarm = 2
      evaluation_periods  = 2
    }
  }
}
