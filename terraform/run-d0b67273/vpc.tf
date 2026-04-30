terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
  backend "s3" {
    bucket         = "vbl-iac-state-aps1-202533543944"
    key            = "runs/d0b67273/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "vbl-iac-terraform-state-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::183295435445:role/TerraformDeployRole"
  }
}

resource "aws_vpc" "vpc_10_0_0_0_21" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name      = "vbl-network-endpoint-main"
    ManagedBy = "terraform"
    RunID     = "d0b67273"
  }
}

resource "aws_internet_gateway" "igw_main" {
  vpc_id = aws_vpc.vpc_10_0_0_0_21.id

  tags = {
    Name      = "vbl-network-endpoint-main-igw"
    ManagedBy = "terraform"
    RunID     = "d0b67273"
  }
}
