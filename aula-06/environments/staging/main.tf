module "vpc" {
  source = "../../modules/vpc"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr
  subnets      = var.subnets
}

module "ec2_sg" {
  source = "../../modules/security-group"

  name         = "${var.project_name}-${var.environment}-ec2-sg"
  description  = "Security Group da EC2"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment

  ingress_rules = [
    {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "rds_sg" {
  source = "../../modules/security-group"

  name         = "${var.project_name}-${var.environment}-rds-sg"
  description  = "Security Group do RDS"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment

  ingress_rules = [
    {
      description = "PostgreSQL dentro da VPC"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = [var.vpc_cidr]
    }
  ]
}

module "ec2" {
  source = "../../modules/ec2"

  instance_name      = "${var.project_name}-${var.environment}-ec2"
  instance_type      = "t2.micro"
  ami_id             = var.ami_id
  subnet_id          = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.ec2_sg.sg_id]
  key_name           = var.key_name
  project_name       = var.project_name
  environment        = var.environment
}

module "rds" {
  source = "../../modules/rds"

  db_name            = "technova_staging"
  db_username        = var.db_username
  db_password        = var.db_password
  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = [module.rds_sg.sg_id]
  instance_class     = "db.t3.micro"
  project_name       = var.project_name
  environment        = var.environment
}