#!/bin/bash
set -e

REPORT_FILE="/home/aryankaushal/infra-testing-framework/reports/infra_compliance_report.html"

BUCKET_NAME=$(terraform -chdir="/home/aryankaushal/infra-testing-framework/terraform" output -raw report_bucket_name)

if [[ ! -f "$REPORT_FILE" ]]; then
  echo "HTML report not found. Generate report first."
  exit 1
fi

aws s3 cp "$REPORT_FILE" "s3://$BUCKET_NAME/infra_compliance_report.html"

echo "Report uploaded to s3://$BUCKET_NAME"

