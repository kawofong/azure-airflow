output "server_name" {
  description = "The name of the PostgreSQL server"
  value       = "${azurerm_postgresql_server.airflow-pgsrv.name}"
}

output "server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the PostgreSQL server"
  value       = "${azurerm_postgresql_server.airflow-pgsrv.fqdn}"
}

output "administrator_user" {
  value = "${azurerm_postgresql_server.airflow-pgsrv.administrator_login}"
}

output "db_airflow_name" {
  value = "${azurerm_postgresql_database.airflow-pgdb.name}"
}

output "acr_hostname" {
  value = "${azurerm_container_registry.airflow-acr.login_server}"
}

output "aks_client_certificate" {
  value = "${azurerm_kubernetes_cluster.airflow-aks.kube_config.0.client_certificate}"
}

output "aks_kube_config" {
  value = "${azurerm_kubernetes_cluster.airflow-aks.kube_config_raw}"
}

output "redis_hostname" {
  value = "${azurerm_redis_cache.airflow-redis.hostname}"
}
