variable "name_prefix" {
  description = "Prefix used for resource names"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group" {
  description = "Resource group name"
  type        = string
}

variable "sql_connection_string" {
  description = "Connection string for the Azure SQL Database"
  type        = string
  sensitive   = true
}
