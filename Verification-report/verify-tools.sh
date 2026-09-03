#!/bin/bash

echo "======================================"
echo " DEVOPS TOOLING VERIFICATION REPORT"
echo "======================================"

echo ""
echo "Operating System:"
cat /etc/os-release | grep PRETTY_NAME

echo ""
echo "Git:"
git --version

echo ""
echo "Docker:"
docker --version

echo ""
echo "Docker Compose:"
docker compose version

echo ""
echo "kubectl:"
kubectl version --client

echo ""
echo "Minikube:"
minikube version

echo ""
echo "Helm:"
helm version --short

echo ""
echo "AWS CLI:"
aws --version

echo ""
echo "Azure CLI:"
az version --output table 2>/dev/null | head -10

echo ""
echo "Node.js:"
node --version

echo ""
echo "npm:"
npm --version

echo ""
echo "jq:"
jq --version

echo ""
echo "Terraform:"
terraform --version

echo ""
echo "Ansible:"
ansible --version | head -5

echo ""
echo "======================================"
echo " VERIFICATION COMPLETE"
echo "======================================"
