output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "IDs das subnets públicas"
  value = [
    for name, subnet in var.subnets :
    aws_subnet.this[name].id
    if subnet.public
  ]
}

output "private_subnet_ids" {
  description = "IDs das subnets privadas"
  value = [
    for name, subnet in var.subnets :
    aws_subnet.this[name].id
    if !subnet.public
  ]
}