terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"            
    }
  }

   backend "s3" {
  bucket = "remote-state-arun"  #bucket name from aws created on cloud
    key    = "remote-state-file"  #our wish key name
    region = "us-east-1"
    dynamodb_table = "remote-state-arun-lock" 
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


