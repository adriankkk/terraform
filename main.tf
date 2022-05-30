#provider "azurerm" {
#    features {}
#    version = "2.98.0"
#}

terraform {
  required_providers {
    azure = {
      source = "hashicorp/azurerm"
      version = "2.98.0"
      }
  }
}

provider "azure" {
features {}
}

resource "azurerm_resource_group" "terra-resource-group" {
  name = "terra_main_rg"
  location  = "northeurope"
}

resource "azurerm_container_group" "terra-container-group" {
  name                  = "weatherapi"
  location              = azurerm_resource_group.terra-resource-group.location
  resource_group_name   = azurerm_resource_group.terra-resource-group.name
  ip_address_type       = "public"
  dns_name_label        = "terra-dns-label"
  os_type               = "Linux"

  container {
    name           = "weatherapi"
    image          = "kuczuraa/weatherapi"
    cpu            = "1"
    memory         = "1"

    ports {
      port = 80
      protocol = "TCP"
    }
  }
}