#!/bin/bash
set -e

echo "Starting infrastructure validation..."
Terraform_dir="/home/aryankaushal/infra-testing-framework/terraform"

RESULTS_FILE="/tmp/infra_results.txt"

> "$RESULTS_FILE"

pass() {
  echo "[PASS] $1"
  echo "$1: PASS" >> "$RESULTS_FILE"
}

fail() {
  echo "[FAIL] $1"
  echo "$1: FAIL" >> "$RESULTS_FILE"
}

# Fetch Terraform outputs
VPC_ID=$(terraform -chdir=$Terraform_dir output -raw vpc_id)
INSTANCE_ID=$(terraform -chdir=$Terraform_dir output -raw instance_id)
SG_ID=$(terraform -chdir=$Terraform_dir output -raw security_group_id)
IAM_PROFILE=$(terraform -chdir=$Terraform_dir output -raw iam_instance_profile)

# 1. VPC exists
aws ec2 describe-vpcs --vpc-ids "$VPC_ID" >/dev/null 2>&1 \
  && pass "VPC exists" \
  || fail "VPC not found"

# 2. EC2 is running
STATE=$(aws ec2 describe-instances \
  --instance-ids "$INSTANCE_ID" \
  --query "Reservations[0].Instances[0].State.Name" \
  --output text)

[[ "$STATE" == "running" ]] \
  && pass "EC2 instance is running" \
  || fail "EC2 is not running"

# 3. Security group attached
ATTACHED_SG=$(aws ec2 describe-instances \
  --instance-ids "$INSTANCE_ID" \
  --query "Reservations[0].Instances[0].SecurityGroups[0].GroupId" \
  --output text)

[[ "$ATTACHED_SG" == "$SG_ID" ]] \
  && pass "Correct security group attached" \
  || fail "Incorrect security group attached"

# 4. IAM role attached
PROFILE=$(aws ec2 describe-instances \
  --instance-ids "$INSTANCE_ID" \
  --query "Reservations[0].Instances[0].IamInstanceProfile.Arn" \
  --output text)

[[ "$IAM_PROFILE" != "None" ]] \
  && pass "IAM role attached to EC2" \
  || fail "IAM role missing"

echo "Infrastructure validation completed successfully."

