variable "app_name" {
  type = string
}

variable "level" {
  type = string
}

variable "target" {
  type = any
}

variable "target_name" {
  type = string
}

variable "set" {
  type = string
}

variable "metric" {
  type = string
}

variable "app_data" {
  type = any
}

variable "metric_data" {
  type = any
}

variable "threshold_overrides" {
  type = any
}

variable "sns_arns" {
  type = list(string)
}
