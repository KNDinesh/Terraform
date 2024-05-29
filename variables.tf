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
