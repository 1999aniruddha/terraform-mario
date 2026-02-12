module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name = var.cluster_name

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = false

  create_cloudwatch_log_group = false

  # Encryption (OK to keep)
  create_kms_key = true
  cluster_encryption_config = {
    resources = ["secrets"]
  }

  # ✅ KEEP THIS
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      min_size       = 1
      max_size       = 2
      instance_types = ["t3.micro"]
    }
  }
}
