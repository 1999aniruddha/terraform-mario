module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name

  vpc_id = "vpc-0e2a7aebb20c84e16"

  subnet_ids = [
    "subnet-0a96aa3d43a92169a",
    "subnet-0bc25a6c8cda14e55"
  ]
}
