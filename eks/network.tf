locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
}

module "vpc" {
  source  = "registry.terraform.io/terraform-aws-modules/vpc/aws"
  version = "5.16.0"

  name = var.project_name
  cidr = var.vpc_cidr

  azs = local.azs
  # ["10.221.0.0/20", "10.221.16.0/20", "10.221.32.0/20"]
  private_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 4, k)]
  # ["10.221.48.0/24", "10.221.49.0/24", "10.221.50.0/24"]
  public_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 48)]
  # ["10.221.52.0/24", "10.221.53.0/24", "10.221.54.0/24"]
  intra_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 52)]

  enable_nat_gateway = true
  single_nat_gateway = true

  # https://docs.aws.amazon.com/eks/latest/userguide/network-reqs.html
  public_subnet_tags  = { "kubernetes.io/role/elb" = 1 }
  private_subnet_tags = { "kubernetes.io/role/internal-elb" = 1 }

  tags = var.tags
}