// See https://learn.microsoft.com/en-us/azure/azure-sql/database/resource-limits-vcore-elastic-pools?view=azuresql for more

data "azurerm_subnet" "devcc-back" {
  name                 = "devcc-back"
  virtual_network_name = "devcc-vnet"
  resource_group_name  = "network-dev-rg"
}

data "azurerm_private_dns_zone" "mssql" {
  name                = "privatelink.database.windows.net"
  resource_group_name = "network-management-rg"
  provider            = azurerm.mgmt
}

module "sqlserver" {
  source = "git::https://github.com/canada-ca-terraform-modules/terraform-azurerm-mssql-server.git?ref=v3.0.0"

  name                = "servername001"
  environment         = "dev"
  location            = "canadacentral"
  resource_group_name = "hosting-sql-dev-rg"

  active_directory_administrator_login_username = ""
  active_directory_administrator_object_id      = ""
  active_directory_administrator_tenant_id      = ""
  administrator_login                           = ""
  administrator_login_password                  = ""

  kv_name                = "hostingops-sql-dev-kv"
  kv_rg                  = "hostingops-sql-dev-rg"
  kv_enable              = true
  sa_resource_group_name = "hostingops-sql-dev-rg"

  firewall_rules = [] #List of IP addresses: Ex. ["0.0.0.0"]

  tags = { "key" : "value" }

  /*
  #[Optional] Configurations
  mssql_version                                 = "12.0"
  emails                                        = ["name@domain.ca"]
  retention_days                                = 90

  */
  /*
  #[Optional] Firewall Configurations
  subnets                                       = [data.azurerm_subnet.devcc-back.id]
  ssl_minimal_tls_version_enforced              = "1.2"
  connection_policy                             = "Default"
  */
  /*
  #[Optional] User Assigned Managed Identity Configurations
  primary_mi_id = "abcdefg1234567"
  */

  /*
  #[Optional] Private Endpoint Configurations
  private_endpoint_subnet_id                    = [data.azurerm_subnet.devcc-back.id]
  private_dns_zone_ids                          = [data.azurerm_private_dns_zone.mssql.id]
  */
}

module "elasticpool" {
  source = "git::https://github.com/canada-ca-terraform-modules/terraform-azurerm-mssql-elasticpool.git?ref=v1.1.0"
  name                = "elasticpoolname001"
  location            = "canadacentral"
  resource_group_name = "hosting-sql-rg"
  server_name         = "servername001"
  sku_name            = "GP_Gen5"
  tier                = "GeneralPurpose"
  capacity            = 2
  min_capacity        = 0.25 
  max_capacity        = 2
  family              = "Gen5"
  tags                = {"key" = "value"}

  #[Optional] Configurations
  #max_size_gb         = 32               # max_size_gb conflicts with max_size_bytes
  #max_size_bytes      = 811748818944
  #zone_redundant      = "BusinessCritical"
}