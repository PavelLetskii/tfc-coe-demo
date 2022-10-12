terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 2.17.0"
    }
  }

  required_version = ">= 0.14.2"
}
