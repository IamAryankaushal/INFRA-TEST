#!/bin/bash
set -e

EC2_IP="$1"
SSH_KEY="/home/aryankaushal/keys-for-infra/aws_key_pair"
SSH_USER="ubuntu"
RESULTS_FILE="/tmp/compliance_results.txt"

> "$RESULTS_FILE"

if [[ -z "$EC2_IP" ]]; then
  echo "Usage: $0 <ec2_public_ip>"
  exit 1
fi

pass() {
  echo "[PASS] $1"
  echo "$1: PASS" >> "$RESULTS_FILE"
}

fail() {
  echo "[FAIL] $1"
  echo "$1: FAIL" >> "$RESULTS_FILE"
}

SSH_CMD="ssh -o StrictHostKeyChecking=no -i $SSH_KEY $SSH_USER@$EC2_IP"

echo "Running post-hardening compliance checks..."

# 1. Root login disabled
$SSH_CMD "sudo grep -q '^PermitRootLogin no' /etc/ssh/sshd_config" \
  && pass "Root SSH login disabled" \
  || fail "Root SSH login NOT disabled"

# 2. Password authentication disabled
$SSH_CMD "sudo grep -q '^PasswordAuthentication no' /etc/ssh/sshd_config" \
  && pass "Password authentication disabled" \
  || fail "Password authentication NOT disabled"

# 3. UFW enabled
UFW_STATUS=$($SSH_CMD "sudo ufw status | head -n 1")

[[ "$UFW_STATUS" == "Status: active" ]] \
  && pass "UFW firewall enabled" \
  || fail "UFW firewall NOT enabled"

# 4. Fail2ban installed
$SSH_CMD "dpkg -l | grep -q fail2ban" \
  && pass "fail2ban installed" \
  || fail "fail2ban NOT installed"

echo "Compliance checks completed."

