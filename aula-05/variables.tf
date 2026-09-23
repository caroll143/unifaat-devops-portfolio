variable "db_name" {
  description = "Nome do banco PostgreSQL"
  type        = string
  default     = "technova"
}

variable "db_username" {
  description = "Usuário do banco PostgreSQL"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Senha do banco PostgreSQL"
  type        = string
  sensitive   = true
}

variable "key_name" {
  description = "Nome do key pair existente na AWS"
  type        = string
  default     = "technova-key"
}

variable "ssh_cidr" {
  description = "CIDR permitido para SSH"
  type        = string
  default     = "0.0.0.0/0"
}