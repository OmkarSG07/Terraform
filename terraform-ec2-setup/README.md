# Provisioning an AWS EC2 Instance Using Terraform

## Overview
This project demonstrates how to use Terraform to provision an AWS EC2 instance and connect to it using VS Code Remote SSH.

## Prerequisites
Before you begin, ensure you have the following:
- **Terraform** installed on your machine ([Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))
- **AWS CLI** configured with your credentials (`aws configure`)
- **VS Code** with the **Remote - SSH** extension

## Steps to Create an EC2 Instance

### 1️⃣ Initialize Terraform
```sh
terraform init
```
This command initializes Terraform and downloads the required AWS provider.

### 2️⃣ Write the Terraform Configuration File (`main.tf`)
```hcl
provider "aws" {
  region = "us-east-1" # Change this as needed
}

resource "aws_key_pair" "my_key" {
  key_name   = "my-terraform-key"
  public_key = file("my-terraform-key.pub")
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Update with a valid AMI ID for your region
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}
```

### 3️⃣ Apply the Terraform Configuration
```sh
terraform apply -auto-approve
```
This command provisions the EC2 instance on AWS.

### 4️⃣ Connect to the EC2 Instance via SSH
```sh
ssh -i my-terraform-key.pem ec2-user@<EC2-Public-IP>
```
Replace `<EC2-Public-IP>` with the actual public IP of your instance (found in AWS Console or via `terraform output`).

### 5️⃣ Connect Using VS Code Remote SSH
1. Open VS Code
2. Install **Remote - SSH** extension (if not installed)
3. Press `Ctrl + Shift + P` and select **Remote-SSH: Connect to Host**
4. Enter the SSH command:
   ```sh
   ssh -i my-terraform-key.pem ec2-user@<EC2-Public-IP>
   ```
5. You should now be connected to your EC2 instance via VS Code!

## Deleting the EC2 Instance
If you want to remove the EC2 instance, run:
```sh
terraform destroy -auto-approve
```
This will delete the instance and all associated resources.

## Conclusion
This project showcases how to automate EC2 provisioning with Terraform and securely connect via VS Code Remote SSH. 🚀

## Next Steps
- Use Terraform variables to make the configuration more dynamic
- Automate provisioning with Terraform modules
- Integrate Ansible for post-deployment configuration

---
**#Terraform #AWS #DevOps #CloudComputing #InfrastructureAsCode #Automation**

