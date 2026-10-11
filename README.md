# ☎️ Lovely Voicemail | Cloud Infrastructure & CI/CD Pipeline

[![CI/CD Pipeline](https://img.shields.io/github/actions/workflow/status/WillSilvaSoftWorks/lovely_voicemail/deploy.yml?branch=main&label=CI%2FCD)](#)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat&logo=docker&logoColor=white)](#)
[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](#)
[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=flat&logo=amazon-aws&logoColor=white)](#)

Lovely Voicemail is a containerized web application that processes and stores audio recordings captured from physical IoT guestbook phones. Originally built as a proprietary production system, this repository demonstrates modern deployment pipelines, Infrastructure as Code (IaC), and secure cloud integration.

## 🏗️ System Architecture

_(Insert a link to your architecture diagram here, e.g., `![Architecture](./docs/architecture.png)`)_

- **Traffic Routing:** AWS Route 53 pointing to an Application Load Balancer.
- **Compute:** Multi-stage Docker containers running on AWS ECS (or EC2).
- **Storage:** Persistent audio payload storage utilizing AWS S3.
- **Infrastructure Provisioning:** Automated state management via Terraform.

## ⚙️ DevOps & Pipeline Automation

The deployment lifecycle is fully automated via GitHub Actions, prioritizing security and zero-downtime deployments.

- **Secure Authentication:** Hardcoded AWS access keys were replaced with OpenID Connect (OIDC) via `aws-actions/configure-aws-credentials`, ensuring temporary, automatically rotated security tokens.
- **Pipeline Health:** Suppressed legacy dependency warnings (DEP0169) and optimized workflow execution steps to consistently achieve passing build metrics.
- **Infrastructure as Code:** All cloud resources (networking, compute, storage) are codified in Terraform, allowing for ephemeral environment recreation and drift detection.

## 🚀 Local Development Quickstart

1. **Clone & Configure:**
   ```bash
   git clone [https://github.com/WillSilvaSoftWorks/Lovely-Voicemail-DevOps-Web-App.git](https://github.com/WillSilvaSoftWorks/Lovely-Voicemail-DevOps-Web-App.git)
   cd Lovely-Voicemail-DevOps-Web-App
   cp .env.example .env
   ```
