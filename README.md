# terraform-aws-acm

AWS Certificate manager Terraform

## Usage

```terraform
provider "aws" {
  alias      = "virginia"
  region     = "us-east-1"
  access_key = var.aws_virginia_access_key
  secret_key = var.aws_virginia_secret_key
}

provider "aws" {
  alias      = "singapore"
  region     = "ap-southeast-1"
  access_key = var.aws_singapore_access_key
  secret_key = var.aws_singapore_secret_key
}

module "acm_singapore" {
  source = "<source>"
    providers = {
    aws = aws.singapore
    }
  acms_domain_name = ["domain1", "domain2"]
  route53_zone_name = "<hostzone_domain_name>"
}

module "acm_virginia" {
  source = "<source>"
    providers = {
    aws = aws.virginia
    }
  acms_domain_name = ["domain1", "domain2"]
  route53_zone_name = "<hostzone_domain_name>"
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 4.0.0 |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 4.7.0   |

## Modules

No modules.

## Resources

| Name                                                                                                                                          | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate)                       | resource    |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource    |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record)                         | resource    |
| [aws_route53_zone.selected_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone)                 | data source |

## Inputs

| Name                                                                                 | Description                                            | Type           | Default | Required |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------ | -------------- | ------- | :------: |
| <a name="input_acms_domain_name"></a> [acms_domain_name](#input_acms_domain_name)    | Domain name for request certificate.                   | `list(string)` | n/a     |   yes    |
| <a name="input_route53_zone_name"></a> [route53_zone_name](#input_route53_zone_name) | Hosted zone name matches with domain name certificate. | `string`       | n/a     |   yes    |

## Outputs

| Name                                                                             | Description     |
| -------------------------------------------------------------------------------- | --------------- |
| <a name="output_certificate_arn"></a> [certificate_arn](#output_certificate_arn) | Certificate ARN |

<!-- END_TF_DOCS -->
