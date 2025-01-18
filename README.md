# Database Trigger Architecture with DynamoDB, Streams, and Lambda

This project implements an event-driven architecture to process database changes in real-time using **Amazon DynamoDB**, **DynamoDB Streams**, **AWS Lambda**, and **Amazon SNS**. The architecture allows processes to run automatically in response to data changes within the database.

## Architecture Diagram
![architecture_new 34](https://github.com/user-attachments/assets/ff6d7502-b2df-4e88-9a54-a6cf3afb9511)


## Overview

The system processes changes in a DynamoDB table by triggering a Lambda function via DynamoDB Streams. This function performs necessary processing and uses Amazon SNS to notify authenticated owners via email.

### Workflow:
1. **Create/Update Item**: An item is added or modified in the DynamoDB table.
2. **DynamoDB Streams**: Captures the change events.
3. **AWS Lambda**: Processes the data from the stream in real-time.
4. **Amazon SNS**: Sends notifications to authenticated owners.

## Features
- **Event-driven architecture** for seamless data processing.
- **Scalable and serverless design** using AWS services.
- **Secure access control** using AWS Identity and Access Management (IAM).
- Notifications sent via email through **Amazon SNS**.

## Prerequisites
- AWS account.
- [Terraform installed](https://developer.hashicorp.com/terraform/downloads).
- IAM user/role with sufficient permissions to deploy resources.
- GitHub repository with CI/CD workflows enabled.

## Technologies Used
- **Amazon DynamoDB**: NoSQL database for storing items.
- **DynamoDB Streams**: Captures table change events.
- **AWS Lambda**: Processes stream data.
- **Amazon SNS**: Sends notifications.
- **Terraform**: Infrastructure as Code (IaC).
- **GitHub Actions**: CI/CD workflows for deployment.

## Setup Instructions

### Step 1: Clone the Repository
```bash
git clone <repository_url>
cd <repository_directory>
```

### Step 2: Configure AWS Credentials
Ensure your AWS credentials are configured locally. You can use the AWS CLI or environment variables:
```bash
aws configure
```

### Step 3: Deploy the Infrastructure
1. Navigate to the `terraform` directory:
   ```bash
   cd terraform
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Plan the deployment:
   ```bash
   terraform plan
   ```
4. Apply the changes:
   ```bash
   terraform apply
   ```

### Step 4: Test the Setup
- Add or update items in the DynamoDB table and verify that the Lambda function processes the changes.
- Check your email for notifications from Amazon SNS.

## CI/CD Workflow with GitHub Actions
This project uses GitHub Actions to automate the deployment process:
- **Terraform Plan**: Validates infrastructure changes.
- **Terraform Apply**: Deploys the infrastructure to AWS.

Update the `.github/workflows/deploy.yml` file to configure the workflow.

## IAM Roles and Security
- An IAM role is created for the Lambda function with necessary permissions to access DynamoDB Streams and publish messages to SNS.
- Ensure minimal access permissions are granted to maintain security.

## License
This project is licensed under the [MIT License](./LICENSE).

## Contributions
Contributions are welcome! Please submit a pull request or raise an issue for suggestions.

## Connect with Me
For any queries, feel free to reach out via LinkedIn or open an issue in the repository.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=flat&logo=linkedin)](www.linkedin.com/in/akalanka007)

