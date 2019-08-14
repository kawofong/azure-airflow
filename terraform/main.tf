provider "azurerm" {
    version = "~>1.5"
}

resource "azurerm_resource_group" "airflow-rg" {
  name     = "${var.prefix}-rg"
  location = "${var.location}"
}

resource "azurerm_postgresql_server" "airflow-pgsrv" {
  name                = "${var.prefix}-pgsrv"
  location            = "${azurerm_resource_group.airflow-rg.location}"
  resource_group_name = "${azurerm_resource_group.airflow-rg.name}"

  sku {
    name     = "B_Gen5_1"
    capacity = 1
    tier     = "Basic"
    family   = "Gen5"
  }

  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }

  administrator_login          = "postgres"
  administrator_login_password = "Pa$$w0rd"
  version                      = "10.0" # version 10.2 is not supported by TF
  ssl_enforcement              = "Enabled"
}

resource "azurerm_postgresql_database" "airflow-pgdb" {
  name                = "airflow"
  resource_group_name = "${azurerm_resource_group.airflow-rg.name}"
  server_name         = "${azurerm_postgresql_server.airflow-pgsrv.name}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_kubernetes_cluster" "airflow-aks" {
  name                = "${var.prefix}-aks"
  location            = "${azurerm_resource_group.airflow-rg.location}"
  resource_group_name = "${azurerm_resource_group.airflow-rg.name}"
  dns_prefix          = "airflow-aks"

  agent_pool_profile {
    name            = "default"
    count           = 1
    vm_size         = "Standard_D4s_v3"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "${var.aks_sp_client_id}"
    client_secret = "${var.aks_sp_client_secret}"
  }
}

resource "azurerm_redis_cache" "airflow-redis" {
  name                = "${var.prefix}-redis"
  location            = "${azurerm_resource_group.airflow-rg.location}"
  resource_group_name = "${azurerm_resource_group.airflow-rg.name}"
  capacity            = 1
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
}
