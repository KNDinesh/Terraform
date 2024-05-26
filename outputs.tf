# export the region
output "region" {
  value = var.region
}

# export the project name
output "project_name" {
  value = var.project_name
}

# export the vpc id
output "vpc_id" {
  value = aws_vpc.main.id
}

# export the internet gateway
output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway
}

# export the public infra subnet 2A
output "Zing-Public-Infra-2A" {
  value = aws_subnet.Zing-Public-Infra-2A.id
}

# export the public infra subnet 2B
output "Zing-Public-Infra-2B" {
  value = aws_subnet.Zing-Public-Infra-2B.id
}

# export the private infra subnet 2A
output "Zing-Private-Infra-2A_id" {
  value = aws_subnet.Zing-Private-Infra-2A.id
}

# export the private infra subnet 2B
output "Zing-Private-Infra-2B_id" {
  value = aws_subnet.Zing-Private-Infra-2B.id
}

# export the public test subnet 2A
output "Zing-Public-Test-2A_id" {
  value = aws_subnet.Zing-Public-Test-2A.id
}

# export the public test subnet 2B
output "Zing-Public-Test-2B_id" {
  value = aws_subnet.Zing-Public-Test-2B.id
}

# export the private test subnet 2A
output "Zing-Private-Test-2A_id" {
  value = aws_subnet.Zing-Private-Test-2A.id
}

# export the private test subnet 2B
output "Zing-Private-Test-2B_id" {
  value = aws_subnet.Zing-Private-Test-2B.id
}

# export the public stage subnet 2A
output "Zing-Public-Stage-2A_id" {
  value = aws_subnet.Zing-Public-Stage-2A.id
}

# export the public stage subnet 2B
output "Zing-Public-Stage-2B_id" {
  value = aws_subnet.Zing-Public-Stage-2B.id
}

# export the private stage subnet 2A
output "Zing-Private-Stage-2A_id" {
  value = aws_subnet.Zing-Private-Stage-2A.id
}

# export the private stage subnet 2B
output "Zing-Private-Stage-2B_id" {
  value = aws_subnet.Zing-Private-Stage-2B.id
}

# export the public prod subnet 2A
output "Zing-Public-Prod-2A_id" {
  value = aws_subnet.Zing-Public-Prod-2A.id
}

# export the public prod subnet 2B
output "Zing-Public-Prod-2B_id" {
  value = aws_subnet.Zing-Public-Prod-2B.id
}

# export the private prod subnet 2A
output "Zing-Private-Prod-2A_id" {
  value = aws_subnet.Zing-Private-Prod-2A.id
}

# export the private prod subnet 2B
output "Zing-Private-Prod-2B_id" {
  value = aws_subnet.Zing-Private-Prod-2B.id
}