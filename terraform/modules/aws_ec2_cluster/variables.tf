variable "cluster_name" {
  type = string
  description = "Name for the cluster for AWS resources to have prefixed"
}

variable "instance_type" {
  type = string
  description = "AWS EC2 instance type for the nodes"
  default = "c5ad.xlarge"
}

variable "ssh_key_name" {
  type = string
  description = "Existing AWS SSH key to add to the launched EC2 instances"
}

variable "node_count" {
  type = string
  description = "Number of nodes to launch"
}
