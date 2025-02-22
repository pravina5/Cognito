output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.user_pool.id
}

output "cognito_user_pool_client_id" {
  value = aws_cognito_user_pool_client.user_pool_client.id
}

output "lambda_function_arn" {
  value = aws_lambda_function.pre_auth_lambda.arn
}

output "iam_role_arn" {
  description = "The IAM Role ARN assigned to the Lambda function"
  value       = aws_iam_role.lambda_exec.arn
}