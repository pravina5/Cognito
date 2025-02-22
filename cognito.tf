resource "aws_cognito_user_pool" "user_pool" {
  name = "rit-user-pool"

  lambda_config {
    pre_authentication = aws_lambda_function.pre_auth_lambda.arn
  }

  auto_verified_attributes = ["email"]

  schema {
    name                     = "email"
    attribute_data_type      = "String"
    required                 = true
    developer_only_attribute = false
  }
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name                = "rit-user-pool-client"
  user_pool_id        = aws_cognito_user_pool.user_pool.id
  generate_secret     = false
  allowed_oauth_flows = ["code", "implicit"]
  allowed_oauth_scopes = ["email", "openid"]
  callback_urls       = ["https://example.com/callback"]
}
