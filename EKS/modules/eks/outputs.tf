output "name" {
  description = "The name of the EKS cluster"
  value       = var.cluster_name
}
output "cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = aws_eks_cluster.main.endpoint
}