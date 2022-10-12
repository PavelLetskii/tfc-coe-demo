variable "vault_address" {
  type        = string
  description = "Address to the Vault instance"
}

variable "vault_storage_path" {
  type        = string
  description = "Path to the config storage in Vault"
}

variable "vault_token" {
  type        = string
  description = "Access token to the Vault secret storage"
}

variable "customer_name" {
  type        = string
  description = "Customer name key in Vault storage"
}

variable "thresholds" {
  type        = any
  description = "Threshold overrides"
  default     = {}
}

variable "applications" {
  type        = any
  description = "Applications to monitor"
}
