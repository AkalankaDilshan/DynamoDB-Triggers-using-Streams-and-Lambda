terraform {
  cloud {

    organization = "ZeroCloud"

    workspaces {
      name = "DynamoDB-Triggers-using-Streams-and-Lambda"
    }
  }
}

# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 4.16"
#     }
#   }

#   required_version = ">= 1.2.0"
# }
