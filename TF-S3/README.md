# Terraform S3 Static Website Hosting with Jenkins Automation

## Overview

This Terraform project provisions an Amazon S3 bucket for static website hosting.  
The infrastructure is deployed using a Jenkins CI/CD pipeline.

---

## Folder Structure

- `main.tf` – Creates the S3 bucket.
- `staticfiles.tf` – Uploads the `index.html` file as an object.
- `bucketpolicy.tf` – Configures public access and website settings.
- `variables.tf` – Input variables like region and bucket name.
- `Jenkinsfile` – Automates provisioning via Jenkins.

---

## Features

* Provisions an S3 bucket  
* Enables static website hosting  
* Uploads an HTML file (`index.html`)  
* Applies public access policy  
* Fully automated using Jenkins pipeline

---

## Jenkins Pipeline Explanation

This project uses a declarative Jenkins pipeline stored in `Jenkinsfile`. The stages include:

1. **Clone Repo**  
   Clones the GitHub repository where this project is hosted.

2. **Terraform Init**  
   Initializes the Terraform working directory (`TF-S3`).

3. **Terraform Plan**  
   Creates and displays an execution plan.

4. **Terraform Apply**  
   Applies the changes to create or update resources automatically.

### Jenkins Environment Setup

Ensure your Jenkins has:
- AWS credentials configured using Jenkins Credentials Manager (`aws_access_key_id`, `aws_secret_key`)
- Terraform installed and accessible via PATH (`/opt/homebrew/bin` if on macOS)

---