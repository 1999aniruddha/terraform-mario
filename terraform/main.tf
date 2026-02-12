module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  # 🔒 IMPORTANT: DO NOT LET TERRAFORM TOUCH CLUSTER CREATION
  create = false

  cluster_name = "mario-eks"

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  # ✅ Allow access management only
  enable_cluster_creator_admin_permissions = false

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      min_size       = 1
      max_size       = 2
      instance_types = ["t3.micro"]
    }
  }
}
