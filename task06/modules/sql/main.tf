locals {
  sql_server_name = "${var.name_prefix}-sql"
  sql_db_name     = "${var.name_prefix}-sql-db"
}


resource "random_password" "sql_admin_password" {
  length  = 16
  special = true
}

resource "azurerm_mssql_server" "sql" {
  name                         = local.sql_server_name
  resource_group_name          = var.resource_group
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = random_password.sql_admin_password.result
}

resource "azurerm_mssql_database" "sql_db" {
  name      = local.sql_db_name
  server_id = azurerm_mssql_server.sql.id
  sku_name  = "S2"
}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "allow_verification_ip" {
  name             = "allow-verification-ip"
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = var.verification_ip
  end_ip_address   = var.verification_ip
}
