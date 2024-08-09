resource "aws_ecr_repository" "this" {
  name         = "${var.env}-${var.ecr_name}-ecr"
  force_delete = true
}

# _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ #

data "aws_caller_identity" "name" {}

# _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ #

output "aws_account_id" {
  value = data.aws_caller_identity.name.account_id
}