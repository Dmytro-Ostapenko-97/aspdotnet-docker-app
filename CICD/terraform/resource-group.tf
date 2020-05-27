# Configure the Azure Provider
provider "azurerm" {     
  version = "=2.0.0" 
  features {}
} 
   
# Configuration a Terraform backend   
terraform { 
  backend "azurerm" {                    
#    resource_group_name   = "aspdotnet-docker-app"
#    storage_account_name  = "tstate4924"
#    container_name        = "tstate"                 
#    key                   = "terraform.tfstate"       
  }    
}  
                 
# Create a Resource Group    
resource "azurerm_resource_group" "resource-group" {
  name     = "aspdotnet-resources-${var.env}" 
  location = "West US"    

  tags = {  
    user = "dostapenko"
    app  = "aspdotnet-docker-app" 
  } 
}

