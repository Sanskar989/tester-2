resource "aws_subnet" "s10_0_0_0_26" {
  vpc_id            = aws_vpc.vpc_10_0_0_0_21.id
  cidr_block        = "10.0.0.0/26"
  availability_zone = "${var.region}a"

  tags = {
    Name      = "not-mayur-vpc"
    ManagedBy = "terraform"
    RunID     = "d0b67273"
  }
}
