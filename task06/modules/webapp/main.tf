locals {
  asp_name = "${var.name_prefix}-asp"
  app_name = "${var.name_prefix}-app"
}


resource "azurerm_app_service_plan" "asp" {
  name                = local.asp_name
  location            = var.location
  resource_group_name = var.resource_group
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "PremiumV3"
    size = "P0v3"
  }

  tags = {
    Creator = "sourabh_suryawanshi@epam.com"
  }
}

resource "azurerm_linux_web_app" "app" {
  name                = local.app_name
  location            = var.location
  resource_group_name = var.resource_group
  service_plan_id     = azurerm_app_service_plan.asp.id

  site_config {
    application_stack {
      dotnet_version = "8.0"
    }
  }

  app_settings = {
    "ConnectionStrings__DefaultConnection" = var.sql_connection_string
  }

  tags = {
    Creator = "sourabh_suryawanshi@epam.com"
  }
}
