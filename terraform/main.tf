terraform {
  required_version = "~> 1.2.9"
}
provider "aws" {
  version = "~> 3.0"
  region                  = "eu-central-1"
 # shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}

terraform {
  backend "s3" {
    bucket = "dpvo-workshop-tf-remote-state-fede"
    key    = "terraform.tfstate"
    region = "eu-central-1"
    profile = "default"
  }
}

