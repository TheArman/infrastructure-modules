resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.private_subnets, count.index)
  availability_zone = var.azs[count.index]

  tags = {
    Name                                               = "${var.env}-private-${count.index + 1}"
    "kubernetes.io/role/internal-elb"                  = "1"
    "kubernetes.io/cluster/${var.env}-${var.eks_name}" = "owned"
  }
}


resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.public_subnets, count.index)
  availability_zone = var.azs[count.index]

  tags = {
    Name                                               = "${var.env}-public-${count.index + 1}"
    "kubernetes.io/role/elb"                           = "1"
    "kubernetes.io/cluster/${var.env}-${var.eks_name}" = "owned"
  }
}