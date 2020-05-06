#Import secrets from Key Vault
data "azurerm_key_vault" "key-vault" {
  name                = "docker-registry"
  resource_group_name = "aspdotnet-docker-app"
}

output "vault_id" { 
  value = data.azurerm_key_vault.key-vault.id
}

data "azurerm_key_vault_secret" "password" { 
  name         = "Password" 
  key_vault_id = data.azurerm_key_vault.key-vault.id 
}

data "azurerm_key_vault_secret" "username" {
  name         = "Username" 
  key_vault_id = data.azurerm_key_vault.key-vault.id 
}  


