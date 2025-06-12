# Terraform EC2 Deployment with Jenkins Automation

## Overview

This project uses Terraform to provision an EC2 instance on AWS.  
The entire infrastructure deployment is automated using a Jenkins pipeline.

---

## Folder Structure

- `main.tf` – Provisions the EC2 instance or autoscaling setup.
- `variables.tf` – Contains input variables (region, AMI, instance type, etc.).
- `terraform.tfvars` – Actual values for the variables.
- `Jenkinsfile` – Automates the Terraform process using Jenkins.

---

## Features

* Deploys an EC2 instance or autoscaling group (ASG)  
* Includes User Data to configure a basic web server  
* Fully automated via Jenkins pipeline  
* Cleans up (optional: destroy after deployment)

---

## Jenkins Pipeline Explanation

This project uses a **declarative Jenkins pipeline** (`Jenkinsfile`) with the following stages:

1. **Clone Repo**  
   Clones your Terraform project from GitHub.

2. **Terraform Init**  
   Initializes the Terraform working directory (`TF-EC2`).

3. **Terraform Validate**  
   Checks the validity of Terraform configuration.

4. **Terraform Plan**  
   Shows the execution plan before applying.

5. **Terraform Apply**  
   Provisions EC2 or ASG with user data automatically.

### Jenkins Environment Setup

- Jenkins must be configured with AWS credentials using the credentials manager:
  - `aws_access_key_id`
  - `aws_secret_key`
- Jenkins node should have:
  - Terraform installed
  - Access to `/opt/homebrew/bin` (adjust `PATH` as needed)

---

## Manual Terraform Commands (Optional)

If you want to run it manually:

```bash
cd TF-EC2
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
