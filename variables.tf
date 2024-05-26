# environment variables
variable "region" {
  default = "us-west-2"
}

variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    cidr_block   = string
    az           = string
    public       = bool
    environment  = string
  }))
  default = {
    "Public-Infra-2A" = {
      cidr_block  = "10.0.1.0/26"
      az          = "us-west-2a"
      public      = true
      environment = "Infra"
    }
    "Public-Infra-2B" = {
      cidr_block  = "10.0.2.0/26"
      az          = "us-west-2b"
      public      = true
      environment = "Infra"
    }
    "Private-Infra-2A" = {
      cidr_block  = "10.0.3.0/26"
      az          = "us-west-2a"
      public      = false
      environment = "Infra"
    }
    "Private-Infra-2B" = {
      cidr_block  = "10.0.4.0/26"
      az          = "us-west-2b"
      public      = false
      environment = "Infra"
    }
    "Public-Test-2A" = {
      cidr_block  = "10.0.5.0/26"
      az          = "us-west-2a"
      public      = true
      environment = "Test"
    }
    "Public-Test-2B" = {
      cidr_block  = "10.0.6.0/26"
      az          = "us-west-2b"
      public      = true
      environment = "Test"
    }
    "Private-Test-2A" = {
      cidr_block  = "10.0.7.0/26"
      az          = "us-west-2a"
      public      = false
      environment = "Test"
    }
    "Private-Test-2B" = {
      cidr_block  = "10.0.8.0/26"
      az          = "us-west-2b"
      public      = false
      environment = "Test"
    }
    "Public-Stage-2A" = {
      cidr_block  = "10.0.9.0/26"
      az          = "us-west-2a"
      public      = true
      environment = "Stage"
    }
    "Public-Stage-2B" = {
      cidr_block  = "10.0.10.0/26"
      az          = "us-west-2b"
      public      = true
      environment = "Stage"
    }
    "Private-Stage-2A" = {
      cidr_block  = "10.0.11.0/26"
      az          = "us-west-2a"
      public      = false
      environment = "Stage"
    }
    "Private-Stage-2B" = {
      cidr_block  = "10.0.12.0/26"
      az          = "us-west-2b"
      public      = false
      environment = "Stage"
    }
    "Public-Prod-2A" = {
      cidr_block  = "10.0.13.0/26"
      az          = "us-west-2a"
      public      = true
      environment = "Prod"
    }
    "Public-Prod-2B" = {
      cidr_block  = "10.0.14.0/26"
      az          = "us-west-2b"
      public      = true
      environment = "Prod"
    }
    "Private-Prod-2A" = {
      cidr_block  = "10.0.15.0/26"
      az          = "us-west-2a"
      public      = false
      environment = "Prod"
    }
    "Private-Prod-2B" = {
      cidr_block  = "10.0.16.0/26"
      az          = "us-west-2b"
      public      = false
      environment = "Prod"
    }
  }
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "Zing"
}

# vpc variables
variable "vpc_cidr" {
  description = "Network range for the Client"
  default     = "10.0.0.0/22"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs to associate with the public route table"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs to associate with the private route table"
  type        = list(string)
}

variable "public_route_table_id" {
  description = "The ID of the public route table"
  type        = string
}

variable "private_route_table_id" {
  description = "The ID of the private route table"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet where the NAT Gateway will be deployed"
  type        = string
}
