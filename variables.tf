variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "ec2_instance_name" {
  description = "ec2 instance name"
  type        = string
  default     = "instance-{each.key}"
}
variable "ami_id" {
  description = "ec2_ami id"
  type        = string
  default     = "ami-05f991c49d264708f"
}

variable "ec2_instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}
variable "monitoring" {
  description = "ec2 instance monitoring"
  type        = bool
  default     = true
}
variable "vpc_security_group_id" {
  description = "Ec2 instance security id"
  type        = list(string)
  default     = ["sg-039795279a13ff7cf"]
}
variable "subnet_id" {
  description = "ec2_instance_subnet_id"
  type        = string
  default     = "subnet-01fe24fd28f59adda"
}
variable "tags_2" {
  description = "tags of environment"
  type        = string
  default     = "dev"
}
variable "tags_1" {
  description = "tags of environment"
  type        = string
  default     = "true"
}
# variable "ec2_source" {
#   description = "ec2_instance_source"
#   type        = string
#   default     = "terraform-aws-modules/ec2-instance/aws"

# }
variable "ec2_instance_count" {
  description = "count of ec2 instance"
  type        = list(string)
  default = ["one", "two", "three"]
}