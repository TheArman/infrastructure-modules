resource "aws_eip" "nat" {
  domain = "vpc"
  count  = length(var.private_subnets)

  tags = {
    Name = "${var.env}-nat-${count.index + 1}"
  }
}