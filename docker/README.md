# docker-airflow

Adopted from [Puckel Airflow Docker Repository](https://github.com/puckel/docker-airflow)

## To Reproduce

- Clone `https://github.com/puckel/docker-airflow`
- Keep only the `config` directory and `Dockerfile`
- In `Dockerfile`:
  - Remove lines that reference `entrypoint.sh`
    - The script `entrypoint.sh` assumes PostgreSQL connection is NOT encrypted by default
    - Azure Database for PostgreSQL enables SSL encryption by default (best practice)
