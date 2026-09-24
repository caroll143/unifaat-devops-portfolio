variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "environment" {
  description = "Ambiente"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
}

variable "subnets" {
  description = "Subnets do ambiente"
  type = map(object({
    cidr               = string
    public             = bool
    availability_zone  = string
  }))
}

variable "ami_id" {
  description = "AMI utilizada pela EC2"
  type        = string
}

variable "key_name" {
  description = "Key Pair da EC2"
  type        = string
}

variable "db_username" {
  description = "Usuario do PostgreSQL"
  type        = string
}

variable "db_password" {
  description = "Senha do PostgreSQL"
  type        = string
  sensitive   = true
}