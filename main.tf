module "vpc" {
  source = "./modules/aws_vpc"
  
  vpc_id          = module.vpc.vpc_id
  region          = var.region
  vpc_cidr        = var.vpc_cidr
  project_name    = var.project_name
}

module "subnets" {
  source = "./modules/aws_subnet"
  
  vpc_id          = module.vpc.vpc_id
  subnets         = var.subnets
  project_name    = var.project_name
}

module "internet_gateway" {
  source = "./modules/aws_igw"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "route_table" {
  source = "./modules/aws_route_table"

  vpc_id              = module.vpc.vpc_id
  nat_gateway_id      = module.nat_gateway.nat_gateway_id
  type                = module.nat_gateway.nat_gateway_id != "" ? "public" : "private"
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  project_name        = var.project_name
}

module "route_table_association" {
  source = "./modules/aws_route_table_association"

  subnets        = var.subnets
  route_table_id = module.route_table.route_table_id
}

module "nat_gateway" {
  source = "./modules/aws_ngw"

  subnet_id    = module.subnets.subnet_id
  project_name = var.project_name
}

module "security_groups" {
  source = "./modules/aws_security_groups"

  description  = "Access for zing systems and users"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name

  egress_rules = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]

  ingress_rules = [
    {
      cidr_blocks      = ["10.0.0.0/22"]
      description      = ""
      from_port        = 3306
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 3306
    },
    {
      cidr_blocks      = ["10.0.0.0/22"]
      description      = "UST workspace"
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    },
    {
      cidr_blocks      = [
        "10.0.0.0/26",
        "10.0.0.64/26",
        "10.0.0.128/26",
        "10.0.0.192/26",
        "10.0.1.0/26",
        "10.0.1.64/26",
        "10.0.1.128/26",
        "10.0.1.192/26",
        "10.0.2.0/26",
        "10.0.2.64/26",
        "10.0.2.128/26",
        "10.0.2.192/26",
        "10.0.3.0/26",
        "10.0.3.64/26",
        "10.0.3.128/26",
        "10.0.3.192/26",
    ]
      description      = ""
      from_port        = 3306
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 3306
    },
    {
      cidr_blocks      = [
        "10.0.0.0/26",
        "10.0.0.64/26",
        "10.0.0.128/26",
        "10.0.0.192/26",
        "10.0.1.0/26",
        "10.0.1.64/26",
        "10.0.1.128/26",
        "10.0.1.192/26",
        "10.0.2.0/26",
        "10.0.2.64/26",
        "10.0.2.128/26",
        "10.0.2.192/26",
        "10.0.3.0/26",
        "10.0.3.64/26",
        "10.0.3.128/26",
        "10.0.3.192/26",
    ]
      description      = ""
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    },
  ]

  name = "zing-Access"
  tags = {
    Name        = "${var.project_name}-sg"
  }
}

module "network_acl" {
  source = "./modules/aws_network_acl"

  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.subnets.subnet_ids
  project_name = var.project_name
  subnets      = var.subnets

  ingress_rules = [
    {
      protocol   = "6"
      rule_no    = 100
      action     = "allow"
      cidr_block = "52.26.224.194/32"
      from_port  = 3389
      to_port    = 3389
    },
    {
    protocol   = "6"
    rule_no    = 110
    action     = "deny"
    cidr_block = "0.0.0.0/0" 
    from_port  = 3389  # RDP port
    to_port    = 3389  # RDP port
    },
    {
    protocol   = "6"
    rule_no    = 120
    action     = "deny"
    cidr_block = "0.0.0.0/0" 
    from_port      = 445  # SMB port
    to_port        = 445  # SMB port
    },
    {
    protocol   = "6"
    rule_no    = 130
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 6667
    to_port    = 6667
    },
    {
      protocol   = "-1"
      rule_no    = 140
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
    }
  ]

  egress_rules = [
    {
      protocol   = "6"
      rule_no    = 100
      action     = "allow"
      cidr_block = "52.26.224.194/32"
      from_port  = 3389
      to_port    = 3389
    },
    {
    protocol   = "6"
    rule_no    = 110
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 3389  
    to_port    = 3389 
    },
    {
    protocol   = "6"
    rule_no    = 120
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 445
    to_port    = 445
    },
    {
    protocol   = "6"
    rule_no    = 130
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 6667
    to_port    = 6667
    },
    {
    protocol   = "-1"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    }
  ]

  tags = {
    Name        = "${var.project_name}-nacl"
  }
}
