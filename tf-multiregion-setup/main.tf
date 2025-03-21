provider "aws"{
    alias = "EC2_instance"
    region = "us-east-1"        #N.Virginia
}
provider "aws"{
    alias = "S3_bucket"
    region = "ap-south-1"       #Mumbai
}
resource "aws_security_group" "ssh_access" {
    name_prefix = "ssh-access-"
    description = "Allow SSH access"
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "EC2_instance"{
    
    provider = aws.EC2_instance
    ami = "ami-032ed30efb4a54e7b"                   # Amazon Linux 2 AMI      
    instance_type = "t2.micro"
    key_name = "12dayChallenge"
    vpc_security_group_ids = [aws_security_group.ssh_access.id]
    
    tags = {
        Name = "Terraform-EC2"
    }
}
resource "aws_s3_bucket" "S3_bucket"{
    provider = aws.S3_bucket
    bucket = "terraform-take-002-omkar" 

  tags = {   
    Name        = "MyTerraformBucket"
    Environment = "Dev"
  }
} 


