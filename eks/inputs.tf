variable "region" {}
variable "project_name" {}
variable "vpc_cidr" {}
variable "tags" {}

data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
  lifecycle {
    postcondition {
      condition     = contains([200], self.status_code)
      error_message = "Check IP call has returned unexpected status code."
    }
  }
}