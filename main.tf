provider "aws" {
  region = "eu-north-1"
}

module "Iam_role" {
  source    = "./modules/Iam_role"
  role_name = "lambdaFunctionRole"
}


module "dynamodb" {
  source     = "./modules/dynamodb"
  table_name = "UsersTable"
}

module "sns" {
  source = "./modules/sns"
}

module "lambda_function" {
  source     = "./modules/lambda"
  role_arn   = module.Iam_role.function_role_arn
  source_arn = module.dynamodb.event_source_arn
}
