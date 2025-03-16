# 🚀 Terraform AWS S3 Bucket Project

## 📖 Overview
This project demonstrates how to use **Terraform** to create and manage an **AWS S3 bucket**.  
It is part of my **Infrastructure as Code (IaC)** learning journey and helps automate cloud resource provisioning efficiently.

## 🛠️ Features
✅ Create an **S3 bucket** using Terraform  
✅ Set bucket **permissions** and **tags**  
✅ Maintain **infrastructure state** using Terraform  
✅ Store project-related files in S3  

## 📂 Project Structure
```
📁 terraform-aws-s3-bucket  
 ├── main.tf               # Terraform configuration file  
 ├── README.md             # Project documentation  
 ├── terraform terminal.jpg  # Screenshot of Terraform commands  
 ├── us-east-1-console-aws-amazon-s3-bucket.png  # AWS S3 Console screenshot  
```

## 🚀 Getting Started

### 1️⃣ **Prerequisites**
Ensure you have the following installed:
- [Terraform](https://developer.hashicorp.com/terraform/downloads)  
- [AWS CLI](https://aws.amazon.com/cli/)  
- AWS IAM credentials configured (`aws configure`)  

### 2️⃣ **Initialize Terraform**
```sh
terraform init
```

### 3️⃣ **Validate the Configuration**
```sh
terraform validate
```

### 4️⃣ **Create the S3 Bucket**
```sh
terraform apply -auto-approve
```

### 5️⃣ **Verify the S3 Bucket**
Check if the bucket was created successfully:
```sh
aws s3 ls
```

### 6️⃣ **Upload Files to S3**
```sh
aws s3 sync . s3://your-s3-bucket-name --exclude "*.tfstate*" --exclude ".terraform/*"
```

## 🛑 Deleting the S3 Bucket
To delete the S3 bucket and clean up resources:
```sh
terraform destroy -auto-approve
```

## 🔥 Challenges Faced
- Encountered **"acl is deprecated"** warning → Fixed by using `aws_s3_bucket_acl`  
- **InvalidBucketName error** → Ensured the bucket name is globally unique  
- **No changes detected in `terraform apply`** → Ran `terraform refresh` to sync state  
