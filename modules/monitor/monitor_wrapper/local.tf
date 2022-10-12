locals {
  app           = var.app_data
  app_overrides = lookup(local.app, "overrides", {})
  set_overrides = lookup(local.app_overrides, var.set, {})
  overrides     = lookup(local.set_overrides, var.metric, {})

  target = var.target

  all_target_overrides = lookup(local.target, "overrides", {})
  set_target_overrides = lookup(local.all_target_overrides, var.set, {})
  target_overrides     = lookup(local.set_target_overrides, var.metric, {})

  int_thresholds = merge(
    var.metric_data.thresholds,
    var.threshold_overrides,
  )

  data = merge(
    var.metric_data,
    { thresholds : local.int_thresholds },
    local.overrides,
    local.target_overrides
  )

  level_string = upper(var.level)

  threshold = lookup(lookup(local.data, "thresholds", {}), var.level, "threshold missing - force fail")

  target_dimensions = local.target.dimensions

  monitor_dimensions_list = flatten([
    for dimension_name, _ in lookup(var.metric_data, "dimensions", {}) : [
      { "n" : dimension_name, "v" : lookup(local.target_dimensions, dimension_name, null) }
    ] if can(index(keys(local.target_dimensions), dimension_name))
  ])
  monitor_dimensions = { for d in local.monitor_dimensions_list : d.n => d.v }

  metric_query = { for mqid, mq in lookup(var.metric_data, "metric_queries", {}) :
    mqid => { for mqk, mqv in mq :
      mqk => try({ for mk, mv in mqv :
        mk => try({ for dk, dv in mv :
          dk => lookup(local.target_dimensions, dk, null)
        }, mv)
      }, mqv)
    }
  }
}
