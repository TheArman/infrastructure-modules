resource "aws_nat_gateway" "nat" {
  count         = length(var.private_subnets)
  allocation_id = aws_eip.nat[count.index].id
  # allocation_id = aws_eip.nat.id
  subnet_id = element(aws_subnet.public[*].id, count.index)
  # subnet_id = aws_subnet.public[*].id

  tags = {
    Name = "${var.env}-nat-${count.index + 1}"
    # Name = "${var.env}-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}