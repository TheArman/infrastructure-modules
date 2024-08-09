variable "env" {
  type = string
}

variable "eks_version" {
  type = string
}

variable "eks_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

# variable "node_iam_policies" {
#   type = map(any)
#   default = {
#     1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#     2 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#     3 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
#     4 = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
#   }
# }

variable "node_groups" {
  type = map(any)
}

# variable "enable_irsa" {
#   type    = bool
#   default = true
# }