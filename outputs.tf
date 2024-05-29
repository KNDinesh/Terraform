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

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value = [for name, subnet in var.subnets : subnet.public ? aws_subnet.subnets[name].id : null]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value = [for name, subnet in var.subnets : !subnet.public ? aws_subnet.subnets[name].id : null]
}

output "nat_gateway_id" {
  value       = module.nat_gateway.nat_gateway_id
  description = "The ID of the created NAT Gateway"
}

output "nat_gateway_eip" {
  value       = module.nat_gateway.nat_gateway_eip
  description = "The Elastic IP associated with the NAT Gateway"
}

# outputs of aws_route_table module
output "route_table_id" {
  description = "The ID of the created route table"
  value       = module.route_table.route_table_id
}

# Output security group ID
output "security_group_id" {
  value       = module.security_groups.security_group_id
  description = "The ID of the security group"
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = module.subnets.subnet_ids
}
