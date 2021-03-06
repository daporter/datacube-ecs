#!/usr/bin/env bash
profile=${2:-"default"}

echo "Deploying $1 as $profile"

pushd infrastructure
rm -rf .terraform
export WORKSPACE=$1
export AWS_PROFILE="$profile"
if [ ! -d "workspaces/$WORKSPACE" ]
then
    echo "Could not find workspace directory $WORKSPACE"
    echo "Aborting..."
    exit 1
fi
terraform init -backend-config backend-prod.cfg
terraform workspace new $WORKSPACE || terraform workspace select $WORKSPACE
terraform plan-input=false -var-file="workspaces/$WORKSPACE/terraform.tfvars" -var 'cluster=datacube-prod'
terraform apply -auto-approve -input=false -var-file="workspaces/$WORKSPACE/terraform.tfvars" -var 'cluster=datacube-prod'
popd
