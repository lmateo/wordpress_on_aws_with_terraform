# Smoke test: plan the root module without real AWS credentials (Terraform 1.7+ mocks).
# Run: (cd main && terraform init -backend=false && terraform test)

mock_provider "aws" {
  override_during = plan
}

mock_provider "aws" {
  alias           = "us-east-1"
  override_during = plan
}

mock_provider "tls" {
  override_during = plan
}

mock_provider "local" {
  override_during = plan
}

override_data {
  target = module.networking.data.aws_availability_zones.available
  values = {
    names    = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
    zone_ids = ["apse1-az1", "apse1-az2", "apse1-az3"]
  }
}

override_data {
  target = data.aws_canonical_user_id.current
  values = {
    id = "mock-canonical-user-id"
  }
}

override_data {
  target = data.aws_cloudfront_log_delivery_canonical_user_id.cloudfront
  values = {
    id = "mock-cloudfront-logs-canonical-id"
  }
}

override_data {
  target = data.aws_iam_policy_document.instance_assume_role_policy
  values = {
    json = <<-EOT
{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}
EOT
  }
}

override_data {
  target = data.aws_iam_policy_document.inline_policy_s3
  values = {
    json = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Action\":\"s3:*\",\"Resource\":\"*\"}]}"
  }
}

override_data {
  target = data.aws_iam_policy_document.inline_policy_cloudfront
  values = {
    json = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Action\":\"cloudfront:ListDistributions\",\"Resource\":\"*\"}]}"
  }
}

run "root_module_plans" {
  command = plan
}
