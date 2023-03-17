# Substrate.io cluster instantiation in AWS

This repo contains the automation code to deploy a [substrate.io](https://substrate.io/) cluster in AWS with EC2 instances in dev mode. Terraform is used for the infrastructure deployment, and Ansible will be used for the configuration of said infrastructure.

To execute the example, inspect the [terraform/example_substrate_cluster](./terraform/example_substrate_cluster) folder:
* `main.tf`:
  * `cluster_name`: the name for all the AWS resources to be prefixed
  * `ssh_key_name`: ssh key name of the key to assign to the EC2 instances (it must already exist in the AWS region)
  * `node_count`: number of EC2 instances to launch

* `providers.tf`:
  * `bucket`: S3 bucket (pre-existent) for terraform state to be stored in
  * `key`: path to the file where to store the terraform state inside the S3 bucket
  * `region`: region of the bucket

Also inspect the [Makefile](./Makefile) and make sure the `AWS_ASG_NAME and `ANSIBLE_SSH_PKEY` variables are correctly set:
* `AWS_ASG_NAME`: use the same value form `cluster_name` above, plus suffixing `\_nodes`.
* `ANSIBLE_SSH_PKEY`: absolute path to the SSH private key used to access the EC2 instances
This last two variables usage needs to be improved to not have to edit the Makefile.

### Requirements
* Ansible 2.12.1 or newer
* Terraform 1.3.6 or newer
* AWS CLI 2.7.17 or newer

After setting the required variables and having the requirements met, to run this automation, `cd` to the root of this repo, and execute:
```shell
make all
```
You will be prompted to confirm when creating the AWS resources, but after that, the rest of the script will run on an unattended fashion.
