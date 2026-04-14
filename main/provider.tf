provider "aws" {
  region = var.region
  default_tags {
    tags = local.default_tags
  }
}

# ACM for CloudFront must use us-east-1; passed into modules/cloudfront (enables terraform test mocks).
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
  default_tags {
    tags = local.default_tags
  }
}

terraform {
  # 1.7+ required for terraform test with mock_provider (see *.tftest.hcl).
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # Stay on AWS provider 5.x until community modules (e.g. vpc 3.x) are upgraded for v6.
      # Bump .terraform.lock.hcl after changing: terraform init -upgrade && terraform providers lock ...
      version = ">= 5.0, < 6.0"
    }
  }

  backend "s3" {
    # `key` is the object path inside the bucket only — do not prefix with s3:// or bucket name.
    bucket         = "tfstate-236143222623"
    key            = "aws-wordpress/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "lockstate"
  }
}
