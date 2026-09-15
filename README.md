# Terraform for Azure Managed Database MSSQL Elastic Pools

## Summary

Creates MSSQL Elastic Pools for use with the Azure Managed Database for MSSQL.
Examples for using the module can be found in the [examples/](examples/) folder.
Changelog can be found in CHANGELOG.md

Using this module you will be able to create:

- [Azure SQL Database Elastic Pool](https://learn.microsoft.com/en-us/azure/azure-sql/database/elastic-pool-overview?view=azuresql)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_elasticpool.elasticpool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_elasticpool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity"></a> [capacity](#input\_capacity) | (Required) The scale up/out capacity, representing server's compute units. For more information see the documentation for your Elasticpool configuration: vCore-based or DTU-based. | `any` | n/a | yes |
| <a name="input_enclave_type"></a> [enclave\_type](#input\_enclave\_type) | (Optional) The type of enclave being used by the database, valid values are Default or VBS. Once enabled removing the enclave\_type field from the configuration file will force the creation of a new resource. | `string` | `null` | no |
| <a name="input_family"></a> [family](#input\_family) | (Optional) The family of hardware Gen4 or Gen5. | `any` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | (Optional) The maximum capacity any one database can consume. | `any` | n/a | yes |
| <a name="input_max_size_bytes"></a> [max\_size\_bytes](#input\_max\_size\_bytes) | (Optional) The max data size of the elastic pool in bytes. Conflicts with max\_size\_gb. | `any` | `null` | no |
| <a name="input_max_size_gb"></a> [max\_size\_gb](#input\_max\_size\_gb) | (Optional) The max data size of the elastic pool in gigabytes. Conflicts with max\_size\_bytes. | `any` | `null` | no |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | (Optional) The minimum capacity all databases are guaranteed. | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the elastic pool. This needs to be globally unique. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the elastic pool. This must be the same as the resource group of the underlying SQL server. | `any` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | (Required) The name of the SQL Server on which to create the elastic pool. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Required) Specifies the SKU Name for this Elasticpool. The name of the SKU, will be either vCore based tier + family pattern (e.g. GP\_Gen4, BC\_Gen5) or the DTU based BasicPool, StandardPool, or PremiumPool pattern. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `any` | `null` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | (Required) The tier of the particular SKU. Possible values are GeneralPurpose, BusinessCritical, Basic, Standard, or Premium. For more information see the documentation for your Elasticpool configuration: vCore-based or DTU-based. | `any` | n/a | yes |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | (Optional) Whether or not this elastic pool is zone redundant. tier needs to be Premium for DTU based or BusinessCritical for vCore based sku. Defaults to false. | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticpool"></a> [elasticpool](#output\_elasticpool) | The elastic pool object |
<!-- END_TF_DOCS -->