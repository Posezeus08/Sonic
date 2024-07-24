provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "sonic-state-bucket"
    key            = "poet-api/terraform.tfstate"
    region         = "us-eaast-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
    ##Assuming bucket and dynamodb table exist already.
  }
}