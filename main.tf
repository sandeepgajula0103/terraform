terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.10"
    }
  }
}
provider "aws" {
  region = "us-west-2"

}
variable "key_name" {
}
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.example.public_key_openssh

}
#abede

module "Ec2_Instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  for_each               = toset(["one", "two", "three"])
  version                = "4.5.0"
  name                   = "instance-{each.key}"
  ami                    = "ami-05f991c49d264708f"
  key_name               = aws_key_pair.generated_key.key_name
  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = ["sg-039795279a13ff7cf"]
  subnet_id              = "subnet-01fe24fd28f59adda"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}
module "s3_bucket" {
  source                   = "terraform-aws-modules/s3-bucket/aws"
  version                  = "4.11.0"
  bucket                   = "sandeep-0103"
  force_destroy            = true
  acl                      = "public-read"
  block_public_acls        = false
  control_object_ownership = true
  object_ownership         = "ObjectWriter"
  versioning = {
    enable = true
  }
}

terraform {
  backend "s3" {
    bucket = "sandeep-0103"
    key    = "mybucket"
    region = "us-west-2"

  }
}
