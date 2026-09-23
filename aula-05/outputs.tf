output "ec2_public_ip" {
  description = "IP público da EC2"
  value       = aws_instance.api.public_ip
}

output "rds_endpoint" {
  description = "Endpoint do RDS PostgreSQL"
  value       = aws_db_instance.postgres.endpoint
}

output "rds_connection_string" {
  description = "String de conexão com o PostgreSQL"
  sensitive   = true
  value       = "postgresql://${var.db_username}:${var.db_password}@${aws_db_instance.postgres.address}:${aws_db_instance.postgres.port}/${var.db_name}"
}