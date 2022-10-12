provider "vault" {
  address = var.vault_address

  auth_login {
    path = "auth/github/login"

    parameters = {
      token = var.vault_token
    }
  }
}

data "vault_generic_secret" "config" {
  path = "${var.vault_storage_path}/${var.customer_name}"
}
