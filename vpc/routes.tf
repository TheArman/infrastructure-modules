resource "aws_route_table" "private" {
  count  = length(var.private_subnets)
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat[count.index].id
  }

  tags = {
    Name = "${var.env}-private-${count.index + 1}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env}-public"
  }
}

# _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ #

resource "aws_route_table_association" "private" {
  # count          = length(var.private_subnets)
  count          = length(aws_subnet.private[*].id)
  route_table_id = aws_route_table.private[count.index].id
  # subnet_id      = aws_subnet.private[count.index].id
  subnet_id = element(aws_subnet.private[*].id, count.index)
}

resource "aws_route_table_association" "public" {
  # count          = length(var.public_subnets)
  count          = length(aws_subnet.public[*].id)
  route_table_id = aws_route_table.public.id
  # subnet_id      = aws_subnet.public[count.index].id
  subnet_id = element(aws_subnet.public[*].id, count.index)
}