## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_image.azure_image](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/image) | resource |
| [azurerm_shared_image.shared_image](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/shared_image) | resource |
| [azurerm_shared_image_version.shared_image_version](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/shared_image_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_images"></a> [images](#input\_images) | The images block | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location for this resource to be put in | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group, this module does not create a resource group, it is expecting the value of a resource group already exists | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_image_id"></a> [image\_id](#output\_image\_id) | The id of the image |
| <a name="output_image_name"></a> [image\_name](#output\_image\_name) | The name of the image |
| <a name="output_shared_image_gallery_name"></a> [shared\_image\_gallery\_name](#output\_shared\_image\_gallery\_name) | The name of the shared image gallery |
| <a name="output_shared_image_id"></a> [shared\_image\_id](#output\_shared\_image\_id) | The id of the shared image |
| <a name="output_shared_image_name"></a> [shared\_image\_name](#output\_shared\_image\_name) | The name of the shared image |
