module "vpc" {
  source = "./modules/vpc"
  
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  subnets      = var.subnets
}

module "subnets" {
  source = "./Modules/aws_subnet"

  vpc_id       = module.vpc.vpc_id
  subnets      = var.subnets
  project_name = var.project_name
}

module "route_tables" {
  source = "./modules/routetables"
  
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "route_table_associations" {
  source = "./modules/routetableassociations"
  
  public_subnet_ids      = module.vpc.public_subnet_ids
  private_subnet_ids     = module.vpc.private_subnet_ids
  public_route_table_id  = module.route_tables.public_route_table_id
  private_route_table_id = module.route_tables.private_route_table_id
}

module "internet_gateway" {
  source = "./Modules/aws_igw"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "nat_gateway" {
  source = "./Modules/aws_ngw"

  public_subnet_id = var.public_subnet_id
  project_name     = var.project_name
}

module "security_groups" {
  source = "./Modules/aws_sg"


}

module "nacl" {
  source = "./Modules/aws_nacl"


}