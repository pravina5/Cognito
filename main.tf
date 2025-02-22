terraform {
  required_version = ">= 1.5.5"

  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "terraform/state"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = var.aws_region
}

# Cognito Setup
module "cognito" {
  source = "./"
}

# Lambda Setup
module "lambda" {
  source       = "./"
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

# IAM Setup
module "iam" {
  source        = "./"
  lambda_arn    = aws_lambda_function.pre_auth_lambda.arn
  user_pool_arn = aws_cognito_user_pool.user_pool.arn
}
