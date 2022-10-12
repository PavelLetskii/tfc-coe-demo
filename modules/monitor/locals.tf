locals {
  monitors = flatten([
    for appname, appdata in var.applications : [
      for target in appdata.targets : [
        for level in lookup(merge(appdata, target), "levels", ["critical", "warning"]) : [
          for set in merge(appdata, target).sets : [
            for metric, metric_data in lookup(module.sets, set, {}) : [
              {
                app_name            = appname,
                set                 = set,
                metric              = metric,
                target              = target,
                target_name         = lookup(target.dimensions, "AutoScalingGroupName", "") != "" ? target.dimensions.AutoScalingGroupName : target.dimensions.InstanceId
                app_data            = appdata,
                metric_data         = metric_data,
                level               = level,
                threshold_overrides = lookup(lookup(var.thresholds, set, {}), metric, {})
              }
            ] if !contains(lookup(appdata, "ignore", []), metric) && !contains(lookup(target, "ignore", []), metric)
          ]
        ]
      ]
    ]
  ])

  integrations = flatten([
    for appname, appdata in var.applications : [
      for type, integrationdata in lookup(appdata, "pagerduty", {}) : [
        {
          appname = appname
          name    = integrationdata.name
          type    = type
          key     = integrationdata.key
        }
      ]
    ]
  ])
}
