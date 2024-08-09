resource "helm_release" "karpenter" {
  namespace        = "karpenter"
  create_namespace = true

  name       = "karpenter"
  repository = "https://charts.karpenter.sh"
  chart      = "karpenter"
  version    = "v0.13.1"
#   version = "0.16.3"

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    # value = aws_iam_role.karpenter_controller.arn
    value = var.karpenter_controller_arn
  }

  set {
    name  = "clusterName"
    # value = aws_eks_cluster.eks.id
    value = var.eks_id
  }

  set {
    name  = "clusterEndpoint"
    # value = aws_eks_cluster.eks.endpoint
    value = var.eks_endpoint
  }

  set {
    name  = "aws.defaultInstanceProfile"
    # value = aws_iam_instance_profile.karpenter.name
    value = var.karpenter_name
  }

  # depends_on = [aws_eks_node_group.general]
}