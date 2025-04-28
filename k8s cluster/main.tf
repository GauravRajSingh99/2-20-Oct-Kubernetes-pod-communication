resource "azurerm_resource_group" "rg" {
  name     = "rgtoppp"
  location = "Japan East"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  depends_on = [ azurerm_resource_group.rg ]
  name                = "clustertoppp"
  location            = "Japan East"
  resource_group_name = "rgtoppp"
  dns_prefix          = "dnsprefixx1"

  default_node_pool {
    name       = "nodepool1"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }
}