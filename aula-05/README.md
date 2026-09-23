\# Aula 05 - RDS e Estado Remoto



\## Objetivo



Implementar uma infraestrutura AWS com Terraform utilizando PostgreSQL no Amazon RDS e armazenamento remoto do Terraform State em S3 com bloqueio via DynamoDB.



\## Arquitetura



A infraestrutura criada possui:



\- VPC `10.0.0.0/16`

\- 1 subnet pública para a EC2

\- 2 subnets privadas em Availability Zones diferentes para o RDS

\- Internet Gateway e rota pública

\- EC2 `t2.micro`

\- Amazon RDS PostgreSQL 15

\- RDS `db.t3.micro`

\- 20 GB de armazenamento `gp2`

\- Criptografia habilitada no RDS

\- RDS sem acesso público

\- Security Group da EC2 com SSH (22) e API (3000)

\- Security Group do RDS permitindo PostgreSQL (5432) somente a partir do Security Group da EC2



\## Estado remoto



O Terraform State principal é armazenado em:



\- S3: `technova-terraform-state-3925000`

\- Chave: `aula-05/terraform.tfstate`

\- Criptografia do backend: habilitada

\- Versionamento do bucket: habilitado

\- Bloqueio: DynamoDB `technova-terraform-lock`

\- Chave de partição do DynamoDB: `LockID`



O bucket possui bloqueio de acesso público habilitado.



\## RDS



Configurações principais:



\- Engine: PostgreSQL 15

\- Classe: `db.t3.micro`

\- Storage: 20 GB `gp2`

\- Multi-AZ: desabilitado

\- Publicamente acessível: desabilitado

\- Criptografia: habilitada

\- Final snapshot: ignorado no destroy conforme requisito da atividade



\## EC2



A EC2 utiliza Amazon Linux 2023 e foi configurada para instalar o cliente PostgreSQL.



Foi realizada conexão da EC2 para o RDS utilizando `psql` com SSL.



\## Evidências



\### State remoto no S3



Comando utilizado:



```text

aws s3 ls s3://technova-terraform-state-3925000/aula-05/

