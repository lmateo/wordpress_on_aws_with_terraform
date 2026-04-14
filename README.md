# wordpress-on-aws-with-terraform

## TODO

- [ ] checkov
- [ ] ludicrousdb

## Description

This project deploys a highly available WordPress site on AWS using Terraform
(Infrastructure as Code). The root stack under `main/` wires together networking,
compute (ASG + ALB), RDS, ElastiCache, EFS, S3, CloudFront, IAM, and KMS.

## Prerequisites

- **Terraform** `>= 1.7.0` (required for `terraform test` and lock/provider
  constraints used in this repo):
  <https://www.terraform.io/downloads/>
- **AWS CLI** version 2:
  <https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html/>
- Shell (sh) or PowerShell on Windows

## Repository tooling (optional)

From the repository root you can run:

- **Markdown:** `npx markdownlint-cli2 "**/*.md"` (uses
  `.markdownlint-cli2.yaml`, respects `.gitignore` so `.terraform/` is skipped)
- **Terraform (stack in `main/`):** `terraform fmt -recursive`, `terraform
  validate`, `terraform test` (see `main/stack.tftest.hcl`), and **TFLint** with
  `.tflint.hcl`

## CI

GitHub Actions under `.github/workflows/` include **Terraform CI** (format,
validate, lint, test on `.tf` / `.tftest.hcl` changes), plus **notify**,
**infra-cost**, and **release** workflows.

## How to contribute

See [how to contribute](howtocontribute.md).

## How to install and run

- Install the prerequisites above.

- Deploy (from the cloned repository):

  ```bash
  cd main
  terraform init
  terraform plan
  terraform apply
  ```

- Destroy:

  ```bash
  terraform destroy
  ```

Configure the S3 backend and any secrets via your usual workflow (e.g.
`terraform.tfvars`, environment variables, or CI variables); see `main/` and
module `variables.tf` files for inputs.

## Architecture

![Architecture diagram](https://i.imgur.com/6aRdaTf.jpg)

## Directory structure

```text
├───📁 .github/
│   └───📁 workflows/
│       ├───📄 notify.yaml
│       ├───📄 infra-cost.yaml
│       ├───📄 release.yaml
│       └───📄 terraform-ci.yaml
├───📁 modules/
│   ├───📁 autoscaling/
│   ├───📁 cloudfront/
│   ├───📁 database/
│   ├───📁 efs/
│   ├───📁 elasticache/
│   ├───📁 iam/
│   ├───📁 kms/
│   ├───📁 networking/
│   └───📁 s3/
├───📁 main/
│   ├───📄 main.tf
│   ├───📄 provider.tf
│   ├───📄 variables.tf
│   ├───📄 outputs.tf
│   ├───📄 locals.tf
│   ├───📄 README.md
│   ├───📄 stack.tftest.hcl
│   └───📄 .terraform.lock.hcl
├───📄 .editorconfig
├───📄 .gitignore
├───📄 .markdownlint-cli2.yaml
├───📄 .tflint.hcl
├───📄 howtocontribute.md
├───📄 README.md
└───📄 repos.yaml
```

Each module directory contains Terraform sources (for example `main.tf`,
`variables.tf`, `outputs.tf`) and related files.
