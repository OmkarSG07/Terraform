provider "aws" {
  region = "us-east-1"  # Ensure this matches your AWS CLI region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-take-001-omkar" 


  tags = {   
    Name        = "MyTerraformBucket"
    Environment = "Dev"
  }
}

