variable "topic_name" {
  description = "name for sns topic"
  type        = string
  default     = "sns_topic"
}

variable "email_address" {
  description = "Email address for SNS subscription"
  type        = string
  default     = "akalankadilshan98@gmail.com"
}