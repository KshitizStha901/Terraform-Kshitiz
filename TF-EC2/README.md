# Terraform EC2 Deployment Module

## Overview

This Terraform configuration deploys an Amazon EC2 instance using an AWS Launch Template and manages it through an Auto Scaling Group (ASG).  
The EC2 instance runs a user data script on startup to install and start an Apache HTTP server, serving a simple welcome webpage.

---

## Files Description

- **main.tf**  
  Defines the AWS provider, the EC2 launch template (with user data), and the Auto Scaling Group.

- **variables.tf**  
  Declares input variables such as AWS region, AMI ID, instance type, key name, and security group IDs.

- **terraform.tfvars**  
  Provides concrete values for the declared variables.

- **output.tf**  
  Outputs useful information after deployment like instance ID and public IP address.

---

## Resources Created

- **AWS Launch Template**  
  Configures the EC2 instance properties and user data script.

- **Auto Scaling Group (ASG)**  
  Ensures the desired number of EC2 instances is running using the launch template.

---

## User Data Script

The instance runs a startup script that:
- Updates the system packages
- Installs Apache HTTP server (`httpd`)
- Starts the Apache service and enables it to start on boot
- Creates a simple HTML file to serve as the homepage

---

## Prerequisites

- AWS CLI configured with appropriate credentials and permissions.
- An existing key pair in AWS matching the `key_name` variable.
- Security Group ID allowing HTTP (port 80) and SSH (port 22) access.

---

## How to Use

1. Initialize Terraform
    ```bash
    terraform init
    ```

2. Validate the configuration
    ```bash
    terraform validate
    ```

3. Review the execution plan
    ```bash
    terraform plan
    ```

4. Apply the configuration to create resources
    ```bash
    terraform apply -auto-approve
    ```

5. After testing, destroy the resources to avoid charges
    ```bash
    terraform destroy -auto-approve
    ```

---

## Notes

- The user data script is base64 encoded as required by AWS launch templates.
- Modify variables in `terraform.tfvars` to match your environment.
- This module deploys in the AWS region specified by the `aws_region` variable.

---

