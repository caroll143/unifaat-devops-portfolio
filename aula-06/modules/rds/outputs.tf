output "endpoint" {
  description = "Endpoint do RDS"
  value       = aws_db_instance.this.endpoint
}

output "db_name" {
  description = "Nome do banco de dados"
  value       = aws_db_instance.this.db_name
}

output "port" {
  description = "Porta do PostgreSQL"
  value       = aws_db_instance.this.port
}