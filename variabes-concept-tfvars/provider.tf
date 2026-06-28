terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"             #--> aws provider version not terraform version
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  #we can give here secret and access keys like but not safe when u push to github it is visible so we are using aws cli
#   access_key = "my-access-key"
#   secret_key = "my-secret-key"
}