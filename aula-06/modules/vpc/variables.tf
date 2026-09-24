variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "environment" {
  description = "Ambiente de execução"
  type        = string
}

variable "subnets" {
  description = "Mapa de subnets públicas e privadas"
  type = map(object({
    cidr        = string
    public      = bool
    availability_zone = string
  }))
}