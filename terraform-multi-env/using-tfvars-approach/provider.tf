terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"             #--> aws provider version not terraform version
    }
  }

  backend "s3" {
    # bucket = "remote-state-arun"  #bucket name from aws created on cloud
    # key    = "remote-state-file"  #our wish key name
    # region = "us-east-1"
    # dynamodb_table = "remote-state-arun-lock" 
    # #lets say 2 developers working on same do if developer 1 runs then developer 2 cant run it is in lock state once developer1 completes the proceess and lock will be released then developer 2 can run for that we are using dynamodb locking it is not for security type 
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  #we can give here secret and access keys like but not safe when u push to github it is visible so we are using aws cli
#   access_key = "my-access-key"
#   secret_key = "my-secret-key"
}