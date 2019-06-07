# Control Panel API Helm Chart

Installing this chart will deploy the Analytical Platform Control Panel, a web
application and REST API with which the creation and maintenance of users, apps
and data sources on the platform can be managed.


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

The instance will be available at https://cpanel-$BRANCH_NAME.<ServicesDomain>.


## Configuration

### Auth0 application

In Auth0 you need to install Extension 'Auth0 Authorization':

1. Login to https://manage.auth0.com/ and select the tenant for your environment
2. In the side-bar click "Extensions"
3. In the list of extensions, if "Auth0 Authorization" is not installed:
    1. Click "Auth0 Authorization" to start installation
    2. Choose "Webtask Storage"
    3. Click "Install"

### cpanel.yml

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `API.Environment.DEBUG` | Used to set Django DEBUG mode | `False` |
| `API.Environment.ENABLE_K8S_RBAC` | Set to `True` if k8s RBAC is enabled | `False` |
| `API.Environment.ENV` | The environment name (`dev` or `alpha`) | |
| `API.Environment.IAM_ARN_BASE` | AWS account's ARN e.g. `arn:aws:iam::123456789012`. Find this with e.g. `aws iam list-users |grep Arn` | |
| `API.Environment.K8S_WORKER_ROLE_NAME` | | |
| `API.Environment.LOGS_BUCKET_NAME` | | |
| `API.Environment.OIDC_CLIENT_ID` | Auth0 'kubectl-oidc' application's client ID | `""` |
| `API.Environment.OIDC_CLIENT_SECRET` | Auth0 'kubectl-oidc' application's client secret | `""` |
| `API.Environment.OIDC_DOMAIN` | Auth0 tenant domain e.g. `dev-analytics-moj.eu.auth0.com` | `""` |
| `API.Environment.OIDC_AUTH_EXTENSION_URL` | OIDC Auth extension url. See above for installing it. For the value, take `"https://AUTH_TENANT.eu.webtask.io/adf6e2f2b84784b57522e3b19dfc9201/api"` and replace AUTH_TENANT with your Auth0 tenant name. The rest of the URL, including the hex, is fixed e.g. `"https://gds-accelerator.eu.webtask.io/adf6e2f2b84784b57522e3b19dfc9201/api"` | `""` |
| `API.Environment.SAML_PROVIDER` | Name of SAML provider. Concatenated
with `IAM_ARN_BASE:saml-provider/` to make an ARN | |
| `API.Environment.SENTRY_DSN` | Sentry credentials | |
| `API.Environment.NFS_HOSTNAME` | NFS hostname | |
| `API.Environment.RSTUDIO_AUTH_CLIENT_DOMAIN` | Auth0 tenant domain e.g. `dev-analytics-moj.eu.auth0.com` | `""` |
| `API.Environment.RSTUDIO_AUTH_CLIENT_ID` | Auth0 'RStudio' application's client ID (see [../rstudio/README.md]) | `""` |
| `API.Environment.RSTUDIO_AUTH_CLIENT_SECRET` | Auth0 'RStudio' application's client secret (see [../rstudio/README.md]) | `""` |
| `API.Environment.TOOLS_DOMAIN` | Tools domain, e.g. `tools.dev.mojanalytics.xyz` | `""` |
| `API.Environment.ELASTICSEARCH_HOST` | Elasticsearch hostname | `""` |
| `API.Environment.ELASTICSEARCH_PORT` | Elasticsearch port number | `9243` |
| `API.Environment.ELASTICSEARCH_USERNAME` | Elasticsearch username | `""` |
| `API.Environment.ELASTICSEARCH_PASSWORD` | Elasticsearch password | `""` |
| `AWS.DefaultRegion` | AWS region | `eu-west-1` |
| `AWS.IAMRole` | IAM role assumed by the instance running the API | |
| `postgresql.postgresDatabase` | The database name where API data will be stored | |
| `postgresql.postgresHost` | The hostname of the database (this will be ignored if `tags.branch` is `true`). Get it from terraform platform output `control_panel_api_db_host` | |
| `postgresql.postgresPassword` | The password to connect to the database with. Get it from the environment's terraform.tfvars | |
| `postgresql.postgresUser` | The username to connect to the database with | |
| `ServicesDomain` | DNS Domain where the app will be hosted | |
| `tags.branch` | If true, a PostgreSQL instance will be deployed alongside the API, instead of using RDS | `false` |
| `ingress.addTlsBlock` | Adds tls block to ingress resource. This needs to be `true` if you're using `nginx` as ingress-controller but it may need to be `false` for others (e.g. `traefik`) | `true` |
