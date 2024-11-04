variable "function_name" {
  description = "name for lambda function"
  type        = string
  default     = "dynamodb_stream_processor"
}


variable "role_arn" {
  description = "Iam role arn"
  type        = string
}
