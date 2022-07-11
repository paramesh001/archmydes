terraform {
  required_version = "~> 0.12.0"
  required_providers {
    aws      = "~> 3.70.0"
    template = "~> 2.0"
    null     = "~> 2.0"
    local    = "~> 1.3"
  }
}
provider "aws" {
  region = "us-east-1"
}
