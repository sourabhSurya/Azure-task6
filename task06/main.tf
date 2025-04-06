resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.location
  tags = {
    Creator = "sourabh_suryawanshi@epam.com"
  }
}

module "sql" {
  source          = "./modules/sql"
  name_prefix     = var.name_prefix
  location        = var.location
  resource_group  = azurerm_resource_group.main.name
  key_vault_name  = var.key_vault_name
  key_vault_rg    = var.key_vault_rg
  verification_ip = var.verification_ip
}

module "webapp" {
  source                = "./modules/webapp"
  name_prefix           = var.name_prefix
  location              = var.location
  resource_group        = azurerm_resource_group.main.name
  sql_connection_string = module.sql.sql_connection_string
}
