resource "aws_dynamodb_table" "users" {
  name         = "UsersTable"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "userId"
  attribute {
    name = "userId"
    type = "S"
  }

  global_secondary_index {
    name            = "user_email_index" # Name for your GSI
    hash_key        = "email"            # Attribute for GSI hash key
    range_key       = "userName"         # Optional range key for GSI (can be omitted)
    projection_type = "ALL"

  }

  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES" # Change to "NEW_IMAGE" or "OLD_IMAGE" for different stream view types
}
