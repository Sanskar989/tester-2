resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc_10_0_0_0_21.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_main.id
  }

  tags = {
    Name      = "vbl-network-endpoint-main-public-rt"
    ManagedBy = "terraform"
    RunID     = "ec088240"
  }
}

resource "aws_route_table_association" "rta_public_1" {
  subnet_id      = aws_subnet.s10_0_0_0_26.id
  route_table_id = aws_route_table.rt_public.id
}
