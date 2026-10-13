terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_openid_connect_provider" "github_actions" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
}

resource "aws_iam_role" "github_actions_elasticbeanstalk" {
  name = "github-actions-elasticbeanstalk-deploy"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github_actions.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:WillSilvaSoftWorks/Lovely-Voicemail-DevOps-Web-App:*"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "elasticbeanstalk" {
  role       = aws_iam_role.github_actions_elasticbeanstalk.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess-AWSElasticBeanstalk"
}

output "github_actions_role_arn" {
  description = "Role ARN to configure as the AWS_ROLE_TO_ASSUME GitHub Actions secret."
  value       = aws_iam_role.github_actions_elasticbeanstalk.arn
}
