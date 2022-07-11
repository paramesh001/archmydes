terraform {
  required_version = "~> 0.13.0"
  required_providers {
    aws      = "~> 4.21.0"
    template = "~> 2.0"
    null     = "~> 2.0"
    local    = "~> 1.3"
  }
}
provider "aws" {
  region = "us-east-1"
}
