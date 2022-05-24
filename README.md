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
  source = "git::ssh://git@github.com/<-repository->/terraform-aws-acm.git?ref=<ref-id>"
  providers = {
    aws = aws.singapore
  }
  acms_domain_name = {
    argocd = {
      domain_name               = "argocd.test.com"
    }
  }
  route53_zone_name = "test.com"
}

module "acm_virginia" {
  source = "git::ssh://git@github.com/<-repository->/terraform-aws-acm.git?ref=<ref-id>"
  providers = {
   aws = aws.virginia
  }
  acms_domain_name = {
    argocd = {
      domain_name               = "argo.test.com"
      subject_alternative_names = ["argo.test.com"]
    }
    app = {
      domain_name               = "app.test.com"
      subject_alternative_names = []
    }
  }
  route53_zone_name = "test.com"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.15.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.selected_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acms_domain_name"></a> [acms\_domain\_name](#input\_acms\_domain\_name) | Domain name for request certificate. | `map(any)` | `{}` | no |
| <a name="input_route53_zone_name"></a> [route53\_zone\_name](#input\_route53\_zone\_name) | Hosted zone name matches with domain name certificate. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag for a resource that create by this component | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_arns"></a> [certificate\_arns](#output\_certificate\_arns) | Certificate ARNs |
<!-- END_TF_DOCS -->
