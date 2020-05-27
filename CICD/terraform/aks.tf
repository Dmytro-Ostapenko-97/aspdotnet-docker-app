resource "azurerm_kubernetes_cluster" "k8s" {
    name                = "aspdotnet-aks-app"
    location            = azurerm_resource_group.resource-group.location
    resource_group_name = azurerm_resource_group.resource-group.name
    dns_prefix          = "aspdotnet-aks-app"

    default_node_pool {
        name            = "agentpool"
        node_count      = 1
        vm_size         = "Standard_D1"
    }

    service_principal {
        client_id     = data.azurerm_key_vault_secret.client-id.value
        client_secret = data.azurerm_key_vault_secret.client-secret.value
    }

    tags = {
        user = "dostapenko"
        app  = "aspdotnet-docker-app" 
    }
}
