variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}
variable "profile" {
  description = "AWS profile"
  type        = string
  default     = "sandbox"
}

variable "applications" {
  default = {
    appname = "test1"
    appdata = {
      targets = {
        level = ["critical"]
        set = "elb"
      } 
    }
  }
}