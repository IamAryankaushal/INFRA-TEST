<div align="center">

# INFRA-TEST
### Infrastructure Quality Assurance Framework

<img src="https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazonaws" />
<img src="https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform" />
<img src="https://img.shields.io/badge/Ansible-Automation-red?style=for-the-badge&logo=ansible" />
<img src="https://img.shields.io/badge/Bash-Scripting-black?style=for-the-badge&logo=gnubash" />
<img src="https://img.shields.io/badge/Linux-Administration-FCC624?style=for-the-badge&logo=linux" />

<br/>
<br/>

Production-oriented Infrastructure Quality Assurance and Validation Framework built using Terraform, Ansible, Bash, and AWS.

Automates infrastructure provisioning, configuration management, compliance validation, security hardening, reporting, and teardown workflows.

</div>

---

# Overview

INFRA-TEST is a cloud infrastructure automation and validation framework designed to demonstrate practical DevOps, Infrastructure Engineering, and Site Reliability Engineering workflows.

The project combines:

- Infrastructure as Code (IaC)
- Configuration Management
- Infrastructure Testing
- Security Hardening
- Automated Validation
- HTML-based Reporting
- Infrastructure Lifecycle Automation

This framework provisions AWS resources, configures systems using Ansible, validates infrastructure state using Bash and AWS CLI scripts, generates compliance reports, and automatically tears down infrastructure resources.

---

# Key Features

## Infrastructure Provisioning
- Automated AWS infrastructure deployment using Terraform
- Provisioning of:
  - VPC
  - EC2
  - IAM Roles
  - S3
  - RDS
  - Security Groups

---

## Configuration Management
- Automated EC2 configuration using Ansible
- SSH hardening
- Firewall configuration
- Passwordless authentication
- Security package installation

---

## Infrastructure Validation
- Bash-based infrastructure testing framework
- AWS CLI validation workflows
- Connectivity and service verification
- Security and compliance checks

---

## Reporting & Auditability
- Automated HTML report generation
- Validation summaries
- Compliance visibility
- Infrastructure testing logs

---

## Automation & Cleanup
- Automated infrastructure teardown
- Ephemeral infrastructure workflow
- Cost-efficient testing lifecycle

---

# Architecture Diagram

<div align="center">

```text
                    ┌────────────────────┐
                    │   Terraform IaC    │
                    └─────────┬──────────┘
                              │
                              ▼
                 ┌──────────────────────────┐
                 │      AWS Infrastructure   │
                 │  EC2 | VPC | IAM | RDS   │
                 └─────────┬────────────────┘
                           │
                           ▼
                 ┌──────────────────────────┐
                 │        Ansible            │
                 │ Configuration Management  │
                 └─────────┬────────────────┘
                           │
                           ▼
                 ┌──────────────────────────┐
                 │ Bash Validation Scripts   │
                 │ AWS CLI Compliance Tests  │
                 └─────────┬────────────────┘
                           │
                           ▼
                 ┌──────────────────────────┐
                 │   HTML Audit Reports      │
                 └──────────────────────────┘
````

</div>

---

# Tech Stack

| Category                 | Technologies |
| ------------------------ | ------------ |
| Cloud Platform           | AWS          |
| Infrastructure as Code   | Terraform    |
| Configuration Management | Ansible      |
| Scripting                | Bash         |
| Automation               | AWS CLI      |
| Operating System         | Linux        |
| Reporting                | HTML         |
| Version Control          | Git & GitHub |

---

# Project Structure

```bash
INFRA-TEST/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
│
├── ansible/
│   ├── inventory
│   ├── playbook.yml
│   └── roles/
│
├── scripts/
│   ├── validate.sh
│   ├── compliance_check.sh
│   └── teardown.sh
│
├── reports/
│   └── infrastructure_report.html
│
├── docs/
│   ├── architecture.png
│   ├── terraform.png
│   └── report.png
│
└── README.md
```

---

# Workflow

## 1. Provision Infrastructure

```bash
terraform init
terraform apply
```

---

## 2. Configure Infrastructure

```bash
ansible-playbook -i inventory playbook.yml
```

---

## 3. Validate Infrastructure

```bash
chmod +x validate.sh
./validate.sh
```

---

## 4. Generate Reports

Validation reports are automatically generated in HTML format.

---

## 5. Destroy Infrastructure

```bash
terraform destroy
```

---

# Security Features

* SSH hardening
* IAM least-privilege principles
* Firewall enforcement
* Passwordless SSH authentication
* Security validation checks
* Compliance verification workflows

---

# Getting Started

## Prerequisites

Ensure the following tools are installed:

* Terraform
* Ansible
* AWS CLI
* Bash
* Git
* AWS Account & Credentials

---

# Clone Repository

```bash
git clone https://github.com/IamAryankaushal/INFRA-TEST.git

cd INFRA-TEST
```

---

# Configure AWS Credentials

```bash
aws configure
```

---

# Deploy Infrastructure

```bash
terraform init

terraform apply
```

---

# Run Ansible Playbooks

```bash
ansible-playbook -i inventory playbook.yml
```

---

# Execute Validation Framework

```bash
chmod +x validate.sh

./validate.sh
```

---

# Skills Demonstrated

* Infrastructure as Code (IaC)
* Cloud Infrastructure Automation
* AWS Services
* Linux Administration
* Bash Scripting
* DevOps Automation
* Configuration Management
* Infrastructure Validation
* Compliance Testing
* Security Hardening
* Infrastructure Lifecycle Management

---

# Future Improvements

* GitHub Actions CI/CD integration
* Kubernetes validation workflows
* Prometheus/Grafana integration
* Dockerized validation runners
* Policy-as-Code using OPA
* Multi-cloud support
* Automated alerting

---

# Resume Alignment

Featured on resume as:

> Infrastructure Quality Assurance Framework | Terraform, Ansible, AWS, Bash Scripting

Key accomplishments:

* Provisioned AWS infrastructure using Terraform
* Automated EC2 configuration using Ansible
* Implemented infrastructure testing and compliance validation
* Generated automated HTML audit reports
* Built end-to-end infrastructure lifecycle automation workflows

---

# Author

## Aryan Kaushal

Cloud / DevOps / Infrastructure Engineering

* GitHub: https://github.com/IamAryankaushal
* LinkedIn: https://www.linkedin.com/in/ar-yan-kau-shal/

---

