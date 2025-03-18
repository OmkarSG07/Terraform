provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "my_ec2"{
    ami = "ami-032ed30efb4a54e7b"       # Amazon Linux 2 AMI      
    instance_type = "t2.micro"
    key_name = "my-terraform-key"
    vpc_security_group_ids = [aws_security_group.ssh_access.id]
    tags = {
        Name = "Terraform-EC2"
    }
}

resource"aws_security_group" "ssh_access"{
    name = "allow_ssh"
    description = "Allow SSH access"
    
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
