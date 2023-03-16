module "substrate_cluster_1" {
  source = "../modules/aws_ec2_cluster"

  cluster_name = "substrate_test_cluster"
  ssh_key_name = "klaus"
  node_count = 3
}
