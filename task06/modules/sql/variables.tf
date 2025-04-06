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

variable "key_vault_name" {
  description = "Name of the existing Azure Key Vault"
  type        = string
}

variable "key_vault_rg" {
  description = "Resource group of the existing Key Vault"
  type        = string
}

variable "verification_ip" {
  description = "IP address for the firewall rule to allow verification access"
  type        = string
}

