resource "aws_lambda_function" "pre_auth_lambda" {
  filename      = "zip/lambda.zip"
  function_name = "pre-auth-rit"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"

  environment {
    variables = {
      ALLOWED_DOMAIN = "rit.edu"
    }
  }
}
