module "lb_alarms" {
    source = "../modules/monitor"

    application = "test_app"
    set = "elb"
    metric = "HealthyHostCount"
}