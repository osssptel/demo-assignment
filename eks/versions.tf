terraform {
  /*backend "s3" {  # Uses local state file for the sake of demo.
    bucket = "<state bucket>"
    key    = "<s3 path"
    region = "ap-southeast-1"
  }*/
  required_version = ">= 1.3.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.81"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.16.1"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = ">=2.1.3"
    }
  }
}
