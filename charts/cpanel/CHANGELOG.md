# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [2.2.0] - 2019-09-09
### Changed
- Added old cpanel frontend hostname to ingress


## [2.1.3] - 2019-08-29
### Added
- Added `secretEnv.SECRET_KEY` value


## [2.1.2] - 2019-08-29
### Changed
- Added missing environment for worker


## [2.1.1] - 2019-08-29
### Changed
- Value for redis-client label must be string


## [2.1.0] - 2019-08-27
### Added
- Redis pod for background tasks and SSE


## [2.0.2] - 2019-08-09
### Changed
- Change BUCKET_REGION env var to AWS_DEFAULT_REGION


## [2.0.1] - 2019-07-04
### Added
- Nginx reverse proxy for serving static files


## [2.0.0] - 2019-06-07
### Added
- Host labels on resources
- Helper templates for hostnames and postgres password
- New ingress for frontend
- Environment variables for frontend

### Changed
- Renamed values per best practices
- Split environment variables into secrets and non-secrets
- Use range to make deployment and secrets environment variable lists DRY
- Simplified resource names
- Use pg_isready instead of python script to check for DB readiness
- Point readinessProbe at django health check


## [1.1.5] - 2019-05-01
### Changed
- Add airflow env vars to secrets


## [1.1.4] - 2019-05-01
### Changed
- Add environment variables for airflow-sqlite deployment


## [1.1.3] - 2019-02-01
### Changed
- AUpdate latest cpanel with tiller 2.13.0


## [1.1.2] - 2019-02-01
### Changed
- Added permission to get and list ingresses


## [1.1.1] - 2018-10-16
### Added
- BUGFIX: Environment variables for JupyterLab deployments added to secrets file


## [1.1.0]
### Added
- Environment variables for JupyterLab deployments


## [1.0.0] - 2018-09-26
### Added
Added (optional) TLS block in ingress resource.
You can set the `ingress.addTlsBlock` value to `false` if your
ingress-controller doesn't work when ingress resources have this block (e.g.
[traefik](https://traefik.io) doesn't seem to work)


## [0.12.2] - 2018-05-30
### Added
Added `ELASTICSEARCH_HOST`, `ELASTICSEARCH_PORT`, `ELASTICSEARCH_USERNAME` and
`ELASTICSEARCH_PASSWORD` env vars to deployment and secrets. This should avoid a
parsing bug.


## [0.12.1] - 2018-05-29
### Added
Added `ELASTICSEARCH_CONN` env var to deployment. Only secret was added before.


## [0.12.0] - 2018-05-04
### Added
Added `ELASTICSEARCH_CONN` env var. Connection string with read-only username and password.


## [0.11.0] - 2018-03-05
### Added
Added `OIDC_AUTH_EXTENSION_URL` env var for the Auth0 extension url which allows
us to request Group Members from the api.


## [0.10.0] - 2018-01-11
### Added
Added `ENABLE_K8S_RBAC` flag. Set to `True` when k8s RBAC is enabled,
the k8s proxy endpoint will then use the user's JWT token to make requests
to kubernetes instead of use the credentials read from the cluster.

See [PR](https://github.com/ministryofjustice/analytics-platform-control-panel/pull/85)


## [0.9.0] - 2017-12-12
### Added
Added environment variables needed to deploy RStudio
- Added `TOOLS_DOMAIN` variable
- Added `RSTUDIO_AUTH_CLIENT_DOMAIN` variable
- Added `RSTUDIO_AUTH_CLIENT_ID` variable
- Added `RSTUDIO_AUTH_CLIENT_SECRET` variable


## [0.7.0] - 2017-10-27
### Added
- Added `NFS_HOSTNAME` variable


## [0.6.0] - 2017-10-26
### Added
- Added `OIDC_*` environment variables


## [0.5.0] - 2017-10-09
### Added
- Added `SENTRY_DSN` environment variables value


## [0.3.1] - 2017-09-15
### Changed
- Renamed `K8S_WORKER_ROLE_ARN` environment variables value to
  `K8S_WORKER_ROLE_NAME`


## [0.3.0] - 2017-09-15
### Added
- Added `K8S_WORKER_ROLE_ARN` environment variables value


## [0.2.0] - 2017-09-11
### Added
- Control Panel API can assume an IAM role passed via `AWS.IAMRole` value
- Added `ENV` environment variable value
- Added `BUCKET_REGION`, `IAM_ARN_BASE` and `LOGS_BUCKET_NAME`  environment variables values
- `CHANGELOG.md`
