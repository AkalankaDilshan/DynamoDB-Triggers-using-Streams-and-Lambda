provider "aws" {
  region = "eu-north-1"
}

module "test_iam_role" {
  source = "./modules/Iam_role"
}


module "dynamodb" {
  source     = "./modules/dynamodb"
  table_name = "UsersTable"
}
