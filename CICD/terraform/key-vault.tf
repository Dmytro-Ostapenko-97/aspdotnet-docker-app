#Import secrets from Key Vault
data "azurerm_key_vault" "key-vault" {
  name                = "dostapenko-key-vault"
  resource_group_name = "aspdotnet-rg"
}

output "vault_id" { 
  value = data.azurerm_key_vault.key-vault.id
}

data "azurerm_key_vault_secret" "password" { 
  name         = "container-registry-password" 
  key_vault_id = data.azurerm_key_vault.key-vault.id 
}

data "azurerm_key_vault_secret" "username" {
  name         = "container-registry-user" 
  key_vault_id = data.azurerm_key_vault.key-vault.id 
}  

data "azurerm_key_vault_secret" "client-id" {
  name         = "client-id"
  key_vault_id = data.azurerm_key_vault.key-vault.id
}

data "azurerm_key_vault_secret" "client-secret" {
  name         = "client-secret"
  key_vault_id = data.azurerm_key_vault.key-vault.id
}
