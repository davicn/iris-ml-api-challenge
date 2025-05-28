terraform {
  required_version = ">=1.10.0"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.5.0"
    }
  }

}

provider "aws" {
    region = var.aws_region
}

resource "aws_s3_bucket" "bucket_name_mlflow" {
    bucket = var.bucket_name_mlflow
    force_destroy = true 

    tags = {
        Name = var.bucket_name_mlflow
    }
  
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket_name_mlflow.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.bucket_name_mlflow.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}