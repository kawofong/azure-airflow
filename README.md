# Airflow on Azure

This repo contains instructions, samples,and best practices for using Apache Airflow on Azure

## Pre-requisite

## Getting Started

- Using Azure CLI:
  - Create service principal
    - Run `az ad sp create-for-rbac --skip-assignment` and note `appId` and `password`

- In `./terraform`:
  - Replace the default for `aks_sp_client_id` and `aks_sp_client_secret` with the generated service principal `appId` and `password` respectively
  - Run `terraform plan -out=out.tfplan`
  - Run `terraform apply out.tfplan`. This process may take up to 5 hours (Azure Redis takes a long time to provision)

## References

- https://azure.microsoft.com/en-us/blog/deploying-apache-airflow-in-azure-to-build-and-run-data-pipelines/
  - https://github.com/Azure/azure-quickstart-templates/tree/master/101-webapp-linux-airflow-postgresql/
- https://medium.com/analytics-and-data/setting-up-airflow-on-azure-connecting-to-ms-sql-server-8c06784a7e2b
- (extra: Databricks & Airflow) https://docs.azuredatabricks.net/user-guide/dev-tools/data-pipelines.html
- https://blog.godatadriven.com/airflow-on-aks
- https://gtoonstra.github.io/etl-with-airflow/deployments.html
- https://github.com/PowerDataHub/terraform-aws-airflow

## Next Steps

- [] Implement [celery executor](https://airflow.apache.org/_api/airflow/executors/celery_executor/index.html)
- [] Implement [kubernetes executor](https://airflow.readthedocs.io/en/stable/kubernetes.html)