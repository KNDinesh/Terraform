# export the region
output "region" {
  value = var.region
}

# export the project name
output "project_name" {
  value = var.project_name
}

# Extracting outputs
output "vpc_id" {
  description = "The VPC ID created by the vpc module"
  value       = module.vpc.vpc_id
}

# outputs of aws_igw module
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.internet_gateway
}

# outputs of aws_ngw module
output "nat_gateway_id" {
  description = "The ID of the created NAT Gateway"
  value       = module.nat_gateway
}

output "public_subnet_id" {
  description = "The ID of the public subnet where the NAT Gateway is deployed"
  value       = var.public_subnet_id
}

# outputs of aws_route_table module
output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = var.public_route_table
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = var.private_route_table
}
