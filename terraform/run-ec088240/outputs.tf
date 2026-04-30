output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc_10_0_0_0_21.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.s10_0_0_0_26.id
}
