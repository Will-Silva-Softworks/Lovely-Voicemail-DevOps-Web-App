Welcome
Hi Welcome, this project was originally a website created for an e-commerce business called Lovely Voice Mail.
It was in use as is the version contained in this repository. Currently not active use project.
This open-source repository serves as a learning environment for DevOps knowledge. That goes with implementing Kubernetes, Docker, and CI/CD technologies etc. Helpful easy reference containing tips for first of all myself and perhaps other developers in the industry

System Architecture
\*\*Will add a diagram here in the future. Will need to be updated.

MISC. Info

The deployment lifecycle is fully automated via GitHub Actions, prioritizing security and zero-downtime deployments.

- **Secure Authentication:** Hardcoded AWS access keys were replaced with OpenID Connect (OIDC) via `aws-actions/configure-aws-credentials`, ensuring temporary, automatically rotated security tokens.
- **Pipeline Health:** Suppressed legacy dependency warnings (DEP0169) and optimized workflow execution steps to consistently achieve passing build metrics.
- **Infrastructure as Code:** All cloud resources (networking, compute, storage) are codified in Terraform, allowing for ephemeral environment recreation and drift detection.

How to configure a local environment for yourself

The root [`main.tf`](./main.tf) creates the GitHub Actions OIDC identity provider and a role trusted only by this repository. The role is attached to AWS's managed `AdministratorAccess-AWSElasticBeanstalk` policy.

Apply it from the repository root using AWS credentials authorized to manage IAM:

```bash
terraform init
terraform plan
terraform apply
terraform output -raw github_actions_role_arn
```

Save the output as the `AWS_ROLE_TO_ASSUME` GitHub Actions secret. The workflow should request an OIDC token with `id-token: write` permission and pass that secret to `aws-actions/configure-aws-credentials` with region `us-east-1`. Keep Terraform state secure because it records infrastructure details.

Quick Start Guide

1. **Clone & Configure:**

```bash
git clone https://github.com/WillSilvaSoftWorks/Lovely-Voicemail-DevOps-Web-App.git
cd Lovely-Voicemail-DevOps-Web-App
cp .env.example .env

```

2. **Spin up containers:**

```bash
docker-compose up --build

```

Your local will be up at http://localhost:8080.
Test

---
