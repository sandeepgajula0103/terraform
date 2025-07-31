variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
  default     = "default-cluster"
}
variable "cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
}
variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be deployed"
  type        = string
  default     = ""

}
variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
  default     = []

}
variable "node_groups" {
  description = "EKS node group configuration name"
  type = map(object({
    instance_type = list(string)
    capacity_type = string
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  }))

}