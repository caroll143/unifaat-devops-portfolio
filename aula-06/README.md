# Aula 06 — Módulos Terraform

## Objetivo

Implementar uma infraestrutura AWS utilizando módulos reutilizáveis do Terraform.

A infraestrutura foi organizada em módulos independentes para VPC, Security Group, EC2 e RDS, permitindo reutilização entre diferentes ambientes.

## Estrutura

```text
aula-06/
├── environments/
│   ├── dev/
│   └── staging/
└── modules/
    ├── vpc/
    ├── security-group/
    ├── ec2/
    └── rds/
```

## Arquitetura

Cada ambiente utiliza os mesmos módulos Terraform, alterando apenas seus parâmetros.

```text
                    AWS
                     |
                  VPC
               /       \
          Public       Private
             |            |
            EC2          RDS
             |            |
             +------------+
                Security
                 Groups
```

## Módulos

### VPC

Responsável por criar:

* VPC;
* subnets públicas;
* subnets privadas;
* Internet Gateway;
* route table pública;
* associações das subnets públicas.

Principais outputs:

* `vpc_id`;
* `public_subnet_ids`;
* `private_subnet_ids`.

### Security Group

Responsável pela criação de Security Groups com regras de entrada configuráveis.

As regras de ingress são recebidas através de uma lista de objetos.

O tráfego de saída é permitido para `0.0.0.0/0`.

Output:

* `sg_id`.

### EC2

Responsável pela criação de uma instância EC2 configurável.

Parâmetros principais:

* AMI;
* tipo da instância;
* subnet;
* Security Groups;
* Key Pair;
* user data opcional.

Outputs:

* `instance_id`;
* `public_ip`;
* `private_ip`.

### RDS

Responsável pela criação do PostgreSQL em subnets privadas.

Configurações utilizadas:

* PostgreSQL;
* `db.t3.micro`;
* armazenamento criptografado;
* acesso privado;
* DB subnet group;
* Security Group.

Outputs:

* `endpoint`;
* `db_name`;
* `port`.

A senha do banco é definida como variável sensível e não deve ser versionada.

## Ambientes

### Dev

VPC:

`10.0.0.0/16`

Subnets públicas:

* `10.0.1.0/24`
* `10.0.2.0/24`

Subnets privadas:

* `10.0.3.0/24`
* `10.0.4.0/24`

Banco:

`technova_dev`

### Staging

VPC:

`10.1.0.0/16`

Subnets públicas:

* `10.1.1.0/24`
* `10.1.2.0/24`

Subnets privadas:

* `10.1.3.0/24`
* `10.1.4.0/24`

Banco:

`technova_staging`

## Pré-requisitos

* Terraform instalado;
* AWS CLI instalado;
* credenciais válidas do AWS Academy/Learner Lab;
* acesso à região `us-east-1`.

## Inicialização

Entrar no ambiente desejado:

```bash
cd environments/dev
```

Inicializar o Terraform:

```bash
terraform init
```

Validar:

```bash
terraform validate
```

Visualizar o plano:

```bash
terraform plan
```

O mesmo procedimento pode ser executado no ambiente `staging`.

## Observação

O exercício foi desenvolvido para validação e planejamento da infraestrutura. O comando `terraform apply` não é necessário para a entrega.
