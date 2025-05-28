variable "aws_region" {
    description = "Região AWS"
    type = string
    default = "sa-east-1"
}

variable "bucket_name_mlflow" {
    description = "Nome do bucket para o MLflow"
    type = string 
}

variable "environment" {
  description = "Ambiente (ex: dev, staging, prod)"
  type        = string
  default     = "dev"
}