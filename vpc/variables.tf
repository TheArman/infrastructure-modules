variable "env" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

# variable "public_subnet_tags" {
#   type = map(any)
# }

# variable "private_subnet_tags" {
#   type = map(any)
# }

variable "eks_name" {
  type = string
}