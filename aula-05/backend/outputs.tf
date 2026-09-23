output "s3_bucket_name" {
  value = "technova-terraform-state-3925000"
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_lock.name
}