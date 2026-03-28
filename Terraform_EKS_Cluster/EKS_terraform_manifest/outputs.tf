output "eks_cluster_endpoint" {
    value = aws_eks_cluster.main.endpoint
    description = " Endpoint for your Kubernetes API server."
  
}

output "eks_cluster_id" {
  value = aws_eks_cluster.main.id
  description = "The name/id of cluster"
}

output "eks_cluster_version" {
    value = aws_eks_cluster.main.version
    description = "EKS Version"
  
}

output "eks_cluster_name" {
    value = aws_eks_cluster.main.name
    description = "EKS cluster name"
  
}

output "eks_cluster_certificate_authority_data" {
    value = aws_eks_cluster.main.certificate_authority[0].data
    description = "Base64 encoded certificate data required to communicate with your cluster."
  
}

output "private_node_group_name" {
    value = aws_eks_node_group.private_nodes.node_group_name
    description = "Name of EKS private node group"
  
}

output "eks_node_instance_role_arn" {
    value = aws_iam_role.eks_nodegroup_role.arn
    description = "IAM Role arn used by EC2 Node group"
  
}

output "to_configure_kubectl" {
    value = "aws eks --region ${var.aws_region} update-kubeconfig --name ${local.eks_cluster_name}"
    description = "commnad to update local kubeconfig to connect to EKS cluster"
  
}