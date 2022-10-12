module "lb_alarms" {
    source = "../modules/monitor"

    applications = ["test_app"]
    customer_name = "test_customer"

}