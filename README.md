# AWS Threat Composer App

## Deployment with ECS, Fargate, Terraform and GitHub Actions

## Introduction

This project demonstrates how to deploy a containerised web application to AWS using a modern, production-style infrastructure setup. I used Docker to package the app, GitHub Actions to automate the build and deployment pipeline, and Terraform to provision the AWS infrastructure required to run the application reliably and at scale.

The stack includes:

- Amazon ECS for container orchestration
- AWS Fargate for serverless container hosting
- Application Load Balancer (ALB) for traffic distribution
- Amazon Route 53 for DNS management
- Amazon Certificate Manager (ACM) for HTTPS
- Terraform for infrastructure as code
- GitHub Actions for CI/CD automation

The goal is to deliver a highly available, secure, and scalable web application that is accessible through a custom domain with HTTPS enabled.

## Architecture Overview

The application is deployed in a VPC with public subnets, behind an ALB and running on ECS Fargate tasks. GitHub Actions builds the Docker image from the application source, pushes it to Amazon ECR, and Terraform provisions the ECS service, networking, load balancer, and DNS configuration.

```mermaid
flowchart LR
    User[Internet User] --> DNS[Route 53 / Custom Domain]
    DNS --> ALB[Application Load Balancer]
    ALB --> ECS[ECS Fargate Tasks]
    ECS --> APP[Threat Composer Web App]
    GH[GitHub Actions] --> ECR[Amazon ECR]
    ECR --> ECS
    TF[Terraform] --> AWS[AWS Infrastructure]
```

## Key Features

- Containerised deployment using Docker
- Serverless compute with AWS Fargate
- Automated CI/CD pipeline with GitHub Actions
- Infrastructure managed as code with Terraform
- HTTPS termination through ALB and ACM
- Custom domain support via Route 53
- Scalable and repeatable AWS deployment model

## Technologies Used

- AWS ECS
- AWS Fargate
- Amazon ECR
- Application Load Balancer
- Route 53
- ACM
- Terraform
- GitHub Actions
- Docker
- Python/Flask or web application stack used by the project

## Repository Structure

```text
.
├── app/                 # Application source code and Docker assets
├── terraform/           # Terraform modules and configuration
├── .github/             # GitHub Actions workflows
├── docs/                # Documentation and screenshots
├── README.md            # Project documentation
├── .gitignore
├── LICENSE
└── ...
```

## Deployment Workflow

1. Application code is developed and committed to GitHub.
2. GitHub Actions triggers a workflow on code changes.
3. The workflow builds the Docker image for the app.
4. The image is pushed to Amazon ECR.
5. Terraform config provisions or updates the ECS, Fargate, ALB, networking, and DNS resources.
6. ECS schedules the updated container tasks.
7. The application becomes available on the configured domain over HTTPS.

## CI/CD Pipeline Success

The GitHub Actions workflow completed successfully, and every stage passed without errors. This confirms the application build and Docker publishing workflow are working correctly.

### Build workflow success

![GitHub Actions build workflow success](docs/images/github-actions-build-success.png)

The build job completed successfully:
- repository checkout passed
- workflow execution succeeded
- environment setup completed
- application build finished without failure

### Docker publish workflow success

![GitHub Actions Docker publish success](docs/images/github-actions-docker-success.png)

The Docker workflow also passed successfully:
- Docker login to Docker Hub succeeded
- image build completed successfully
- image push completed successfully
- final pipeline steps finished cleanly

### Result

All pipeline checks passed, the container image was built and published successfully, and the deployment process is working as expected.

## Threat Composer Dashboard

![Threat Composer dashboard](docs/images/threat-composer-dashboard.png)

## Prerequisites

Before deploying this project, ensure you have:

- An AWS account with sufficient permissions
- Terraform installed locally
- Docker installed locally
- AWS CLI configured
- A custom domain managed in Route 53 (optional but recommended)
- GitHub repository access and GitHub Actions enabled

## Example Deployment Commands

```bash
# Initial Terraform setup
terraform init
terraform plan
terraform apply
```

## Notes

This project is designed to showcase a practical AWS deployment pattern for a container-based application. It combines infrastructure automation, DevOps workflows, and secure web hosting to provide a modern cloud deployment architecture.

## License

This project is licensed under the MIT License. See the LICENSE file for details.


Introduction


This project demonstrates the deploying a containerised web application to AWS. I've used Docker for efficient application packaging, GitHub Actions for automated image building and pushing to ECR and Terraform for defining and managing all necessary AWS infrastructure including - ECS, Fargate, ALB and Route53. The goal is to create a highly available web service accessible via my custom domain.

![alt text](image-2.png)

Directory Structure
/
├── .github/
│   └── workflows/
│       ├── docker-build.yml
│       ├── terraform-plan.yml
│       ├── terraform-apply.yml
│       └── terraform-destroy.yml
├── app/
├── images/
├── terraform/
│   ├── modules/
│   │   ├── alb/
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── iam/
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── ecs/
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── dns/
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── vpc/
│   │   │  ├── main.tf
│   │   │  ├── outputs.tf
│   │   │  └── variables.tf
│   │   └── acm/
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── terraform.tfvars
│   └── variables.tf
├── .gitignore
└── README.md

Deployment Workflow
Docker Build
New changes are pushed to Github
Workflow builds the image
Pushes the image to Amazon ECR
Latest image deployed by ECS