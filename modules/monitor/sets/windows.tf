locals {
  windows = {
    cpu = {
      name = "CPU load is high on a Linux VM"
      thresholds = {
        critical = 90
        warning  = 80
      }

      dimensions = {
        InstanceId           = ""
        AutoScalingGroupName = ""
      }

      metric_name = "CPUUtilization"
      namespace   = "AWS/EC2"
      period      = 900
      statistic   = "Average"
    }


    memory = {
      name = "Available memory is low on a Linux VM"
      thresholds = {
        critical = 95
        warning  = 90
      }

      dimensions = {
        InstanceId           = ""
        AutoScalingGroupName = ""
      }

      metric_name = "Memory % Committed Bytes In Use"
      namespace   = "CWAgent"
      period      = 900
      statistic   = "Average"
    }


    disk_space = {
      name = "Available disk space is low on a Linux VM"
      thresholds = {
        critical = 10
        warning  = 20
      }

      comparison_operator = "LessThanOrEqualToThreshold"
      dimensions = {
        InstanceId           = ""
        AutoScalingGroupName = ""
        device               = ""
        fstype               = ""
        path                 = "/"
      }

      metric_name = "LogicalDisk % Free Space"
      namespace   = "CWAgent"
      period      = 900
      statistic   = "Average"
    }

    system_status = {
      name = "EC2 - StatusCheckFailed_System"
      thresholds = {
        critical = 0
        warning  = 0
      }

      dimensions = {
        InstanceId = ""
      }

      metric_name         = "StatusCheckFailed_System"
      namespace           = "AWS/EC2"
      period              = 60
      statistic           = "Maximum"
      datapoints_to_alarm = 3
      evaluation_periods  = 3
    }

    instance_status = {
      name = "EC2 - StatusCheckFailed_Instance"
      thresholds = {
        critical = 0
        warning  = 0
      }

      dimensions = {
        InstanceId = ""
      }

      metric_name         = "StatusCheckFailed_Instance"
      namespace           = "AWS/EC2"
      period              = 60
      statistic           = "Maximum"
      datapoints_to_alarm = 3
      evaluation_periods  = 3
    }
  }
}
