locals {
  rds = {
    cpu = {
      name = "RDS - High CPUUtilization"
      thresholds = {
        critical = 90
        warning  = 80
      }

      dimensions = {
        DBInstanceIdentifier = ""
      }

      metric_name         = "CPUUtilization"
      namespace           = "AWS/RDS"
      period              = 300
      statistic           = "Average"
      datapoints_to_alarm = 3
      evaluation_periods  = 3
    }

    free_storage_space = {
      name = "RDS - Low FreeStorageSpace"
      thresholds = {
        critical = 1073741824
        warning  = 2073741824
      }

      comparison_operator = "LessThanThreshold"
      dimensions = {
        DBInstanceIdentifier = ""
      }

      metric_name         = "FreeStorageSpace"
      namespace           = "AWS/RDS"
      period              = 300
      statistic           = "Average"
      datapoints_to_alarm = 2
      evaluation_periods  = 2
    }

    disk_queue_depth = {
      name = "RDS - High DiskQueueDepth"
      thresholds = {
        critical = 80
        warning  = 70
      }

      dimensions = {
        DBInstanceIdentifier = ""
      }

      metric_name         = "DiskQueueDepth"
      namespace           = "AWS/RDS"
      period              = 60
      statistic           = "Sum"
      datapoints_to_alarm = 15
      evaluation_periods  = 15
    }

    write_latency = {
      name = "RDS - High write latency"
      thresholds = {
        critical = 1.005
        warning  = 0.9
      }

      dimensions = {
        DBInstanceIdentifier = ""
      }

      metric_name         = "WriteLatency"
      namespace           = "AWS/RDS"
      period              = 300
      statistic           = "Average"
      datapoints_to_alarm = 2
      evaluation_periods  = 2
    }

    read_latency = {
      name = "RDS - High read latency"
      thresholds = {
        critical = 1.001
        warning  = 0.9
      }

      dimensions = {
        DBInstanceIdentifier = ""
      }

      metric_name         = "ReadLatency"
      namespace           = "AWS/RDS"
      period              = 300
      statistic           = "Average"
      datapoints_to_alarm = 2
      evaluation_periods  = 2
    }

    swap_usage = {
      name = "RDS - High swap usage"
      thresholds = {
        critical = 104857600
        warning  = 84857600
      }

      dimensions = {
        DBInstanceIdentifier = ""
      }

      metric_name         = "SwapUsage"
      namespace           = "AWS/RDS"
      period              = 300
      statistic           = "Average"
      datapoints_to_alarm = 2
      evaluation_periods  = 2
    }
  }
}
