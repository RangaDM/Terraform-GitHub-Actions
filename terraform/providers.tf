terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # REMOTE BACKEND CONFIGURATION
  # Replace the bucket, region, and table with your actual pre-created values.
  backend "s3" {
    bucket         = "my-terraform-state-bucket-unique-123" # REPLACE THIS
    key            = "ec2-testing/terraform.tfstate"          # Path inside the bucket
    region         = "us-east-1"                              # REPLACE THIS
    encrypt        = true
    dynamodb_table = "my-terraform-lock-table"                # REPLACE THIS
  }
}

provider "aws" {
  region = var.aws_region
}