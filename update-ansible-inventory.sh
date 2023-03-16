#!/usr/bin/env bash
set -e

echo "Waiting for instances to be available"
sleep 20

if [ -f "ansible/.env" ]; then
  cat /dev/null > ansible/.env
fi

nodes_ips=$(aws ec2 describe-instances --region ${AWS_REGION} --output text --filters "Name=tag:aws:autoscaling:groupName,Values=${AWS_ASG_NAME}" "Name=instance-state-name,Values=running" --query 'Reservations[].Instances[].{IP:PublicIpAddress}')

echo "Populating ansible/.env with nodes' IPs:"
n=0
for node_ip in $nodes_ips; do
  echo "export NODE${n}=${node_ip}" >> ansible/.env
  echo "export NODE${n}=${node_ip}"
  n=$(( n+1 ))
done
