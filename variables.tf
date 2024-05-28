# environment variables
variable "region" {
  description = "Region where the resources will get deployed"
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "Zing"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/22"
}

variable "vpc_id" {
  type    = string
  default = "vpc-08aa64413764fa8df"
}

variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    cidr_block = string
    az        = string
    public    = bool
    environment = string
  }))
  default = {
    "Public-Infra-2A" = {
      cidr_block = "10.0.0.0/26"
      az        = "us-west-2a"
      public    = true
      environment = "Infra"
    },
    "Public-Infra-2B" = {
      cidr_block = "10.0.0.64/26"
      az        = "us-west-2b"
      public    = true
      environment = "Infra"
    },
    "Private-Infra-2A" = {
      cidr_block = "10.0.0.128/26"
      az        = "us-west-2a"
      public    = false
      environment = "Infra"
    },
    "Private-Infra-2B" = {
      cidr_block = "10.0.0.192/26"
      az        = "us-west-2b"
      public    = false
      environment = "Infra"
    },
    "Public-Test-2A" = {
      cidr_block = "10.0.1.0/26"
      az        = "us-west-2a"
      public    = true
      environment = "Test"
    },
    "Public-Test-2B" = {
      cidr_block = "10.0.1.64/26"
      az        = "us-west-2b"
      public    = true
      environment = "Test"
    },
    "Private-Test-2A" = {
      cidr_block = "10.0.1.128/26"
      az        = "us-west-2a"
      public    = false
      environment = "Test"
    },
    "Private-Test-2B" = {
      cidr_block = "10.0.1.192/26"
      az        = "us-west-2b"
      public    = false
      environment = "Test"
    },
    "Public-Stage-2A" = {
      cidr_block = "10.0.2.0/26"
      az        = "us-west-2a"
      public    = true
      environment = "Stage"
    },
    "Public-Stage-2B" = {
      cidr_block = "10.0.2.64/26"
      az        = "us-west-2b"
      public    = true
      environment = "Stage"
    },
    "Private-Stage-2A" = {
      cidr_block = "10.0.2.128/26"
      az        = "us-west-2a"
      public    = false
      environment = "Stage"
    },
    "Private-Stage-2B" = {
      cidr_block = "10.0.2.192/26"
      az        = "us-west-2b"
      public    = false
      environment = "Stage"
    },
    "Public-Prod-2A" = {
      cidr_block = "10.0.3.0/26"
      az        = "us-west-2a"
      public    = true
      environment = "Prod"
    },
    "Public-Prod-2B" = {
      cidr_block = "10.0.3.64/26"
      az        = "us-west-2b"
      public    = true
      environment = "Prod"
    },
    "Private-Prod-2A" = {
      cidr_block  = "10.0.3.128/26"
      az          = "us-west-2a"
      public      = false
      environment = "Prod"
    },
    "Private-Prod-2B" = {
      cidr_block  = "10.0.3.192/26"
      az          = "us-west-2b"
      public      = false
      environment = "Prod"
    }
  }
}

variable "public_subnet_id" {
  description = "The ID of the public subnet where the NAT Gateway will be deployed"
  type        = string
  default     = "subnet-01968f16b673877b9"
}

variable "public_subnet_ids" {
  description = "A list of public subnets inside the VPC"
  type = list(string)
  default = ["subnet-01968f16b673877b9", "subnet-0d551d3e5ee6b0a22", "subnet-031f62fe8c628b603", "subnet-02c332c3f7d7efefa", "subnet-06e37d1f09fac92af", "subnet-04f949d7c7c91ea8e", "subnet-07b80e92955ea9cc4", "subnet-00817c06df8dc4734"]
}

variable "private_subnet_ids" {
  description = "A list of private subnets inside the VPC"
  type = list(string)
  default = ["subnet-053d056232e4a5dd4", "subnet-0b06da97c6f86cadb", "subnet-06682df5e1f956fbb", "subnet-0c3ce5dcb1fe02bcb", "subnet-041e4e0ddc9ac8111", "subnet-046cd1d433bad7102", "subnet-0e6eba414c973daa7", "subnet-04c83877427c7df91"]
}

variable "public_route_table" {
  description = "The ID of the public route table"
  type        = string
  default     = "rtb-0223e16efce4c5ccc"
}

variable "private_route_table" {
  description = "The ID of the private route table"
  type        = string
  default     = "rtb-073577ea5d0c05731"
}

variable "subnet_ids" {
  description = "List of subnet IDs associated with the network ACL"
  type        = list(string)
  default     = ["subnet-031f62fe8c628b603", "subnet-02c332c3f7d7efefa"]
}
