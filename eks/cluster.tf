module "eks" {
  source  = "registry.terraform.io/terraform-aws-modules/eks/aws"
  version = "20.31.4"

  cluster_name    = var.project_name
  cluster_version = "1.31"

  enable_cluster_creator_admin_permissions = true
  cluster_endpoint_public_access           = true
  # Enlist my IP to access EKS API server endpoint.
  cluster_endpoint_public_access_cidrs     = ["${chomp(data.http.my_ip.response_body)}/32"]

  # Turn off non-essential feature for the sake of demo.
  cluster_enabled_log_types       = []
  create_cloudwatch_log_group     = false
  cluster_encryption_config       = {}
  create_kms_key                  = false
  kms_key_deletion_window_in_days = 7

  cluster_addons = {
    coredns            = {}
    kube-proxy         = {}
    vpc-cni            = {}
    aws-ebs-csi-driver = {}
    eks-pod-identity-agent = {}
    # Turn off non-essential feature for the sake of demo.
    # aws-guardduty-agent = {}
    # eks-node-monitoring-agent = {}
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  eks_managed_node_group_defaults = {
    capacity_type = "SPOT"
    ami_type      = "AL2023_x86_64_STANDARD"
    min_size      = 1
    max_size      = 3
    desired_size  = 1
    iam_role_additional_policies = {
      ebs_csi_driver = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
    }
  }

  eks_managed_node_groups = {
    system = {  # The node group that only run addons, separated from user workload for ease of maintenance, scaling.
      instance_types = ["t3a.small"]
      taints = {
        CriticalAddonsOnly = { key = "CriticalAddonsOnly", effect = "NO_EXECUTE" }
      }
    }

    workloads = { # The node group that run argocd & airflow.
      instance_types = ["t3a.large"]
    }
  }

  node_security_group_tags = var.tags
  tags                     = var.tags
}