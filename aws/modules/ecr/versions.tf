terraform {
  required_version = "~> 1.2.3"
  required_providers {
    aws      = "~> 3.25.0"
    template = "~> 2.0"
    null     = "~> 2.0"
    local    = "~> 1.3"
  }
}
provider "aws" {
  region = "us-east-1"
}
