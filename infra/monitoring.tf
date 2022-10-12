module "lb_alarms" {
    source = "../modules/monitor"

    applications = "test_app"
    customer_name = "test_customer"

    vault_address = ""
    vault_storage_path = ""
    vault_token = ""
}