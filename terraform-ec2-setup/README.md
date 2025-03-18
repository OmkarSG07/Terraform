# 🚀 Provisioning an AWS EC2 Instance Using Terraform

## 📌 Overview
Infrastructure as Code (IaC) is transforming cloud infrastructure management. In this project, I used Terraform to provision an AWS EC2 instance and connect to it using VS Code Remote SSH! 🎉

## 🔹 What I Learned from This Project:
✅ Writing Terraform configurations to provision an EC2 instance  
✅ Creating and using an AWS Key Pair for secure SSH access  
✅ Automating infrastructure provisioning with `terraform apply`  
✅ Connecting to EC2 via SSH and VS Code Remote SSH  
✅ Understanding how Terraform manages infrastructure state  

## 🛠 Project Setup & Steps

### 1️⃣ Initialize Terraform
```sh
terraform init
```
This command initializes Terraform and downloads the required AWS provider.

### 2️⃣ Write the Terraform Configuration (`main.tf`)
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

## ⚡ Challenges I Encountered & Solved:
🔸 **Invalid AMI ID error** – Ensure the correct AMI ID is used for the selected AWS region  
🔸 **SSH permission issues** – Used `chmod 400 my-terraform-key.pem` to set correct file permissions  
🔸 **Connection issues in VS Code** – Ensured SSH key and user were correctly configured  

## 🗑️ Deleting the EC2 Instance
If you want to remove the EC2 instance, run:
```sh
terraform destroy -auto-approve
```
This will delete the instance and all associated resources.

## 🚀 What’s Next?
🔹 Automate provisioning with Terraform modules  
🔹 Use Terraform variables for dynamic configurations  
🔹 Integrate Ansible for post-deployment automation  



