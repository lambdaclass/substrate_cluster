.PHONY: infrastructure update-ansible-inventory run-ansible install destroy

SHELL := /bin/bash

infrastructure:
	@terraform -chdir=terraform/example_substrate_cluster/ init
	@terraform -chdir=terraform/example_substrate_cluster/ apply

AWS_ASG_NAME=substrate_test_cluster_nodes
AWS_REGION=us-west-2
export AWS_ASG_NAME
export AWS_REGION
update-ansible-inventory:
	@./update-ansible-inventory.sh

ANSIBLE_SSH_PKEY="/Users/klaus/Downloads/klaus (1).pem"
export ANSIBLE_SSH_PKEY
run-ansible:
	. ansible/.env && ansible-playbook -i ansible/inventory.yaml ansible/playbooks/substrate-node.yaml

all: infrastructure update-ansible-inventory run-ansible

destroy:
	@terraform -chdir=terraform/example_substrate_cluster/ destroy
