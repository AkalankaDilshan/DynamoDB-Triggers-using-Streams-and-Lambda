resource "aws_dynamodb_table" "users" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "userId"
  attribute {
    name = "userId"
    type = "S"
  }

  global_secondary_index {
    name     = "user_email_index" # Name for your GSI
    hash_key = "email"            # Attribute for GSI hash key
    #range_key       = "userName"         # Optional range key for GSI (can be omitted)
    projection_type = "ALL"
  }

  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  server_side_encryption {
    enabled = true
  }

  tags = {
    Name = "UsersTable"
  }
}

# Item 1
resource "aws_dynamodb_table_item" "user_item_1" {
  table_name = aws_dynamodb_table.users.name
  hash_key   = "userId"
  item = jsonencode({
    "userId" : "user123",
    "userName" : "Luke Skywalker",
    "email" : "usetheforceluke@example.com"
  })
}

# Item 2
resource "aws_dynamodb_table_item" "user_item_2" {
  table_name = aws_dynamodb_table.users.name
  hash_key   = "userId"
  item = jsonencode({
    "userId" : "user456",
    "userName" : "Leia Organa",
    "email" : "princessleia@example.com"
  })
}

# Item 3
resource "aws_dynamodb_table_item" "user_item_3" {
  table_name = aws_dynamodb_table.users.name
  hash_key   = "userId"
  item = jsonencode({
    "userId" : "user789",
    "userName" : "Han Solo",
    "email" : "hansolo@example.com"
  })
}
