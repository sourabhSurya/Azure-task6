variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "cmaz-dfc0edb2-mod6"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "East US"
}

variable "key_vault_rg" {
  description = "Resource group name for existing Key Vault"
  type        = string
  default     = "cmaz-dfc0edb2-mod6-kv-rg"
}

variable "key_vault_name" {
  description = "Existing Key Vault name"
  type        = string
  default     = "cmaz-dfc0edb2-mod6-kv"
}

variable "verification_ip" {
  description = "IP address allowed to access SQL Server"
  type        = string
  default     = "18.153.146.156"
}
