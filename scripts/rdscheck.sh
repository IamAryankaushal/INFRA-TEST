#!/bin/bash
set -e

RDS_ENDPOINT=$(terraform -chdir="/home/aryankaushal/infra-testing-framework/terraform" output -raw rds_endpoint)

if [[ -z "$RDS_ENDPOINT" ]]; then
  echo "[FAIL] RDS endpoint not found"
  exit 1
fi

echo "[PASS] RDS endpoint exists: $RDS_ENDPOINT"

