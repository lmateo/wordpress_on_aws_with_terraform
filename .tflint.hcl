# https://github.com/terraform-linters/tflint
tflint {
  required_version = ">= 0.50.0"
}

plugin "terraform" {
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
  version = "0.13.0"
}

plugin "aws" {
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
  version = "0.41.0"
}

rule "terraform_deprecated_interpolation" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_documented_variables" {
  enabled = false
}

rule "terraform_documented_outputs" {
  enabled = false
}

# Many modules pre-date current tagging conventions; enable selectively later.
rule "aws_resource_missing_tags" {
  enabled = false
}
