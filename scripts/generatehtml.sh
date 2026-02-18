#!/bin/bash

REPORT_DIR="/home/aryankaushal/infra-testing-framework/reports"
REPORT_FILE="$REPORT_DIR/infra_compliance_report.html"
INFRA_RESULTS="/tmp/infra_results.txt"
COMPLIANCE_RESULTS="/tmp/compliance_results.txt"
TIMESTAMP=$(date)

mkdir -p "$REPORT_DIR"

cat <<EOF > "$REPORT_FILE"
<!DOCTYPE html>
<html>
<head>
  <title>Infrastructure Validation Report</title>
  <style>
    body { font-family: Arial, sans-serif; }
    h1 { color: #2c3e50; }
    table { border-collapse: collapse; width: 80%; }
    th, td { border: 1px solid #ccc; padding: 8px; }
    .pass { color: green; }
    .fail { color: red; }
  </style>
</head>
<body>

<h1>Infrastructure & Compliance Report</h1>
<p><strong>Generated:</strong> $TIMESTAMP</p>

<h2>Infrastructure Validation</h2>
<table>
<tr><th>Check</th><th>Status</th></tr>
EOF

while read -r line; do
  CHECK=$(echo "$line" | cut -d':' -f1)
  STATUS=$(echo "$line" | cut -d':' -f2 | xargs)
  CLASS="pass"; [[ "$STATUS" != "PASS" ]] && CLASS="fail"
  echo "<tr><td>$CHECK</td><td class=\"$CLASS\">$STATUS</td></tr>" >> "$REPORT_FILE"
done < "$INFRA_RESULTS"

cat <<EOF >> "$REPORT_FILE"
</table>

<h2>Compliance Checks</h2>
<table>
<tr><th>Check</th><th>Status</th></tr>
EOF

while read -r line; do
  CHECK=$(echo "$line" | cut -d':' -f1)
  STATUS=$(echo "$line" | cut -d':' -f2 | xargs)
  CLASS="pass"; [[ "$STATUS" != "PASS" ]] && CLASS="fail"
  echo "<tr><td>$CHECK</td><td class=\"$CLASS\">$STATUS</td></tr>" >> "$REPORT_FILE"
done < "$COMPLIANCE_RESULTS"

cat <<EOF >> "$REPORT_FILE"
</table>
</body>
</html>
EOF

echo "HTML report generated at: $REPORT_FILE"

