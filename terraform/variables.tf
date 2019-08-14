variable "prefix" {
  description = "The prefix which should be used for all resources in this project"
  default = "azure-airflow"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "East US"
}

variable "aks_sp_client_id" {
  description = "Client id for AKS service principal"
  default = "<Todo-AKS-service-principal-client-id>"
}

variable "aks_sp_client_secret" {
  description = "Client secret for AKS service principal"
  default = "<Todo-AKS-service-principal-client-secret>"
}