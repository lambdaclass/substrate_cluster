module "substrate_cluster_1" {
  source = "../modules/aws_ec2_cluster"

  cluster_name = "substrate_test_cluster"
  vpc_name = "lambda-vpc"
  # instance_type = "t2.micro"
  ssh_key_name = "klaus"
  node_count = 3
}
