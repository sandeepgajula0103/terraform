variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "string"
}

variable "availability_zones" {
  description = "List of availability zones for the VPC"
  type        = list(string)
  default     = []

}
variable "private_subnet_cidrs" {
  description = "List of CIDRs for private subnets"
  type        = list(string)
  default     = []
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
  default     = "default-cluster"

}
variable "public_subnet_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
  default     = []

}