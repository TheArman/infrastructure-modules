output "eks_name" {
  value = aws_eks_cluster.eks.name
}

# output "openid_provider_arn" {
#   value = aws_iam_openid_connect_provider.this[0].arn
# }

output "eks_id" {
  value = aws_eks_cluster.eks.id
}

output "eks_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "karpenter_controller_arn" {
  value = aws_iam_role.karpenter_controller.arn
}

output "karpenter_name" {
  value = aws_iam_instance_profile.karpenter.name
}