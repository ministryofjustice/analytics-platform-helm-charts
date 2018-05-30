# Control Panel API Helm Chart

Installing this chart will deploy the Analytical Platform Control Panel API, a
REST API with which the creation and maintainance of users, apps and data
sources on the platform can be managed.


## Installing the Chart

To install the chart:

```bash
helm install mojanalytics/cpanel \
  --name cpanel-$BRANCH_NAME \
  --set API.Environment.DEBUG=True \
  --set API.Image.Tag=$DOCKER_IMAGE_TAG \
  --set API.Branch=$BRANCH_NAME \
  --set tags.branch=true
```

The instance will be available at https://cpanelapi-$BRANCH_NAME.<ServicesDomain>.


## Configuration

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `API.Environment.DEBUG` | Used to set Django DEBUG mode | `False` |
| `API.Environment.ENABLE_K8S_RBAC` | Set to `True` if k8s RBAC is enabled | `False` |
| `API.Environment.ENV` | The environment name (`dev` or `alpha`) | |
| `API.Environment.IAM_ARN_BASE` | | |
| `API.Environment.K8S_WORKER_ROLE_NAME` | | |
| `API.Environment.LOGS_BUCKET_NAME` | | |
| `API.Environment.OIDC_CLIENT_ID` | OIDC Client ID | `""` |
| `API.Environment.OIDC_CLIENT_SECRET` | OIDC Client secret | `""` |
| `API.Environment.OIDC_DOMAIN` | OIDC domain | `""` |
| `API.Environment.OIDC_AUTH_EXTENSION_URL` | OIDC Auth extension url | `""` |
| `API.Environment.SAML_PROVIDER` | Name of SAML provider. Concatenated
with `IAM_ARN_BASE:saml-provider/` to make an ARN | |
| `API.Environment.SENTRY_DSN` | Sentry credentials | |
| `API.Environment.NFS_HOSTNAME` | NFS hostname | |
| `API.Environment.RSTUDIO_AUTH_CLIENT_DOMAIN` | OAuth client domain for RStudio | `""` |
| `API.Environment.RSTUDIO_AUTH_CLIENT_ID` | OAuth client ID for RStudio | `""` |
| `API.Environment.RSTUDIO_AUTH_CLIENT_SECRET` | OAuth client secret for RStudio | `""` |
| `API.Environment.TOOLS_ID` | Tools domain, e.g. "tools.example.com" | `""` |
| `API.Environment.ELASTICSEARCH_HOST` | Elasticsearch hostname | `""` |
| `API.Environment.ELASTICSEARCH_PORT` | Elasticsearch port number | `9243` |
| `API.Environment.ELASTICSEARCH_USERNAME` | Elasticsearch username | `""` |
| `API.Environment.ELASTICSEARCH_PASSWORD` | Elasticsearch password | `""` |
| `AWS.DefaultRegion` | AWS region | `eu-west-1` |
| `AWS.IAMRole` | IAM role assumed by the instance running the API | |
| `postgresql.postgresDatabase` | The database name where API data will be stored | |
| `postgresql.postgresHost` | The hostname of the database (this will be ignored if `tags.branch` is `true`) | |
| `postgresql.postgresPassword` | The password to connect to the database with | |
| `postgresql.postgresUser` | The username to connect to the database with | |
| `ServicesDomain` | DNS Domain where the app will be hosted | |
| `tags.branch` | If true, a PostgreSQL instance will be deployed alongside the API, instead of using RDS | `false` |
