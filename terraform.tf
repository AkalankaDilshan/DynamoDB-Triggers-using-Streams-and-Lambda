terraform {
  cloud {

    organization = "ZeroCloud"

    workspaces {
      name = "DynamoDB-Triggers-using-Streams-and-Lambda"
    }
  }
}
