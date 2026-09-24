output "vpc_id" {
  description = "ID da VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Subnets publicas"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Subnets privadas"
  value       = module.vpc.private_subnet_ids
}

output "ec2_instance_id" {
  description = "ID da EC2"
  value       = module.ec2.instance_id
}

output "ec2_public_ip" {
  description = "IP publico da EC2"
  value       = module.ec2.public_ip
}

output "rds_endpoint" {
  description = "Endpoint do RDS"
  value       = module.rds.endpoint
}

output "rds_db_name" {
  description = "Nome do banco"
  value       = module.rds.db_name
}