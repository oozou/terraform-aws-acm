# terraform-aws-acm

AWS Certificate manager Terraform

## Usage
```
Please see at examples/complete
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

| Name                                                                                                      | Description                                                | Type          | Default | Required |
| --------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_acms_domain_name"></a> [acms_domain_name](#input_acms_domain_name)                         | Domain name for request certificate.                       | `map(any)`    | `{}`    |    no    |
| <a name="input_is_automatic_verify_acms"></a> [is_automatic_verify_acms](#input_is_automatic_verify_acms) | Whether to automatically verify all acm domain on route53. | `bool`        | `true`  |    no    |
| <a name="input_route53_zone_name"></a> [route53_zone_name](#input_route53_zone_name)                      | Hosted zone name matches with domain name certificate.     | `string`      | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                             | Tag for a resource that create by this component           | `map(string)` | `{}`    |    no    |

## Outputs

| Name                                                                                | Description      |
| ----------------------------------------------------------------------------------- | ---------------- |
| <a name="output_certificate_arns"></a> [certificate_arns](#output_certificate_arns) | Certificate ARNs |

<!-- END_TF_DOCS -->
