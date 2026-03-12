resource "azurerm_application_gateway" "gateway" {

  name                = "${var.prefix}-agw"
  location            = var.location
  resource_group_name = var.resource_group

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 1
  }

  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = var.appgw_subnet_id
  }

  frontend_port {
    name = "frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = var.public_ip_id
  }

  backend_address_pool {
    name = "vmss-backend"
  }

  backend_http_settings {
    name                  = "backend-http-settings"
    port                  = 3000
    protocol              = "Http"
    request_timeout       = 30
    cookie_based_affinity = "Disabled"
  }

  http_listener {
    name                           = "listener"
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name             = "frontend-port"
    protocol                       = "Http"
  }


  request_routing_rule {
    name                       = "routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "listener-name"
    backend_address_pool_name  = "pool-name"
    backend_http_settings_name = "setting-name"
    priority                   = 100 # <--- Add this line
  }

}
