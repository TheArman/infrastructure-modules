variable "env" {
  type = string
}

variable "eks_name" {
  type = string
}

variable "chart_version" {
  type = string
}

variable "app_values" {
  type = list(string)
}


variable "github_name" {
  type = string
}

variable "github_token" {
  type = string
}