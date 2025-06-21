terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.10"
    }
  }
}
provider "aws" {
  region = var.region

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

module "Ec2_Instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  for_each               = toset(var.ec2_instance_count)
  version                = "4.5.0"
  name                   = var.ec2_instance_name
  ami                    = var.ami_id
  key_name               = aws_key_pair.generated_key.key_name
  instance_type          = var.ec2_instance_type
  monitoring             = var.monitoring
  vpc_security_group_ids = var.vpc_security_group_id
  subnet_id              = var.subnet_id
  tags = {
    Terraform   = var.tags_1
    Environment = var.tags_2
  }

}
module "s3_bucket" {
  source                   = "terraform-aws-modules/s3-bucket/aws"
  version                  = "4.11.0"
  bucket                   = "sandeep-010392"
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