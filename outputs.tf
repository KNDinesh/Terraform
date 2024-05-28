# export the region
output "region" {
  value = var.region
}

# export the project name
output "project_name" {
  value = var.project_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
  description = "The VPC ID created by the vpc module"
}
