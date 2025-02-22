variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "allowed_domain" {
  description = "Allowed email domain for Cognito authentication"
  default     = "rit.edu"
}
