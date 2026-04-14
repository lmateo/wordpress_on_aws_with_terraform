# wordpress-on-aws-with-terraform

## TODO

- [ ] checkov
- [ ] ludicrousdb

## Description

This project deploys a highly available WordPress site on AWS using Terraform
(Infrastructure as Code).

## Prerequisites

- Terraform v1.2.2 or later: <https://www.terraform.io/downloads/>
- AWS CLI version 2:
  <https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html/>
- Shell (sh) or PowerShell on Windows

## How to contribute

Please see
[how to contribute](https://github.com/hiimtung/wordpress_on_aws_with_terraform/blob/main/howtocontribute.md).

## How to install and run

- Install all prerequisites above.

- Deploy:

  ```bash
  cd ~/wordpress-on-aws-with-terraform/main
  terraform init
  terraform plan
  terraform apply
  ```

- Destroy:

  ```bash
  terraform destroy
  ```

## Architecture

![Architecture diagram](https://i.imgur.com/6aRdaTf.jpg)

## Directory structure

```text
├───📁 .github/
│   └───📁 workflows/
│       ├───📄 notify.yaml
│       └───📄 infra-cost.yaml
│       └───📄 release.yaml
├───📁 modules/
│   ├───📁 autoscaling/
│   │   ├───📄 main.tf
│   │   ├───📄 outputs.tf
│   │   ├───📄 userdata.tftpl
│   │   └───📄 variables.tf
│   ├───📁 database/
│   │   ├───📁 resources/
│   │   │   └───...
│   │   ├───📄 db-rotate.tf
│   │   ├───📄 local.tf
│   │   ├───📄 main.tf
│   │   ├───📄 output.tf
│   │   └───📄 variables.tf
│   ├───📁 efs/
│   │   ├───📄 main.tf
│   │   ├───📄 outputs.tf
│   │   └───📄 variables.tf
│   ├───📁 elasticache/
│   │   ├───📄 main.tf
│   │   ├───📄 outputs.tf
│   │   └───📄 variables.tf
│   ├───📁 networking/
│   │   ├───📄 main.tf
│   │   ├───📄 outputs.tf
│   │   └───📄 variables.tf
│   └───📁 s3/
│       ├───📄 main.tf
│       ├───📄 outputs.tf
│       └───📄 variables.tf
├───📁 main/
│   ├───📄 locals.tf
│   ├───📄 main.tf
│   ├───📄 outputs.tf
│   ├───📄 provider.tf
│   ├───📄 README.md
│   └───📄 variables.tf
├───📄 .editorconfig
├───📄 .gitignore
├───📄 howtocontribute.md
├───📄 README.md
└───📄 repos.yaml

```
