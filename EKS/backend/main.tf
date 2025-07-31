terraform {
  required_providers {
    aws= {
        version = "~>5.0"
    }
  }
}
provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "example" {
    bucket = "demo-terraform-eks-state-sandeep-bucket"
lifecycle {
  prevent_destroy = false
    }  
}
resource "aws_dynamodb_table" "basic_dynamodb-table" {
    name = "terraform-eks-state-locks"
    billing_mode =  "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
  
}