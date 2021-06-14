# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [3.3.0] - 2021-06-14
### Added
- Added EFS_Hostname variable

## [3.2.0] - 2021-05-04
### Added
- Added `secrets.create` with a default of `true`. This dictates if the helm chart creates Kubernetes secret resources
- Change the Deployment resources to use the `apps/v1 API version` instead of `extensions/v1beta1` as this is no longer served since Kubernetes 1.16.
.

## [3.1.0] - 2020-11-23
### Added
- Support for `imagePullSecrets` to allow pulling of docker images using
  credentials in given secret files. This is an empty list by default (so
  not used). Also, at the moment the only image used by this helm chart which
  is in DockerHub is the reverse proxy one (`nginxinc/nginx-unprivileged:1.16.0-alpine`).


## [3.0.0] - 2020-10-01
### Changed - BREAKING CHANGES
- Removed `redis` chart dependency, the Redis cluster will **not** be
  deployed/managed by this chart anymore
- CP will use Redis cluster on AWS EC instead (via `redis.scheme`/`redis.host`
  value)
- added `redis.host` and `redis.scheme` (can be `redis` or `rediss` for
  secure connection to redis)
- renamed `redis.redisPort` to just `redis.port` for consistency.
  This defaults to `"6379"` and we don't override it so it shouldn't cause
  much trouble in our deployment. But it is another breaking change.
- removed now unnecessary `redis-client` label. This was used by redis helm
  chart to limit access to server. Something doesn't make sense for Redis
  on AWS EC (because it's outside k8s cluster and k8s network policies only
  work within k8s cluster).


## [2.4.8] - 2020-09-22
### Changed
- removed unused postgres helm chart dependency (we use the Postgres running
  on AWS RDS)
- added NOTES.txt to display correct URL (`controlpanel.` insteaf of legacy
  `cpanel-BRANCH`), also updated README with this URL which is the one we
  should use instead of legacy one.
- removed confusing and unused `tags.branch` feature and related value
- removed unused/confusing template helpers related to branch-Postgres:
  - removed `postgresHost()` helper, `tags.branch` is always `false` so we can
    simply use `.Values.postgresql.postgresHost` as expected
  - removed `postgresPassword()`, not used, `.Values.postgresql.postgresPassword`
    used everywhere as expected
  - removed `postgresRelease()`, this was the hostname of the branch-Postgres
    which was only used when `.Values.tags.branch=true`. As this is always
    false in our case, this can now go as result of `postgresHost()` going


## [2.4.7] - 2020-09-22
### Fixed
Fixed `cpanel-read-apps-ingresses`' `roleRef` to use new
`cpanel-read-apps-ingresses` name. The `Role` and `RoleBinding` were renamed
for consistency/readability as part of previous release but this wasn't
changed and caused CP's "Manage app" page to throw an error because of
missing permissions.


## [2.4.6] - 2020-09-14
### Changed
Move `worker` containers in separate pod from nginx/django "frontend" containers.
These are decoupled from the frontend and there are good arguments to scaling
these up independently from the django instances.

Also increased the number of `worker` replicas to `10` now that this is in
a separate pod. Both this value and the existing `3` replicas of the frontend
have been now moved into the `frontend.replicas` and `worker.replicas` value.


## [2.4.5] - 2020-09-14
### Changed
Further tweaking liveliness probe for `worker` (Django Channels) container
to account for potentially very slow background tasks blocking a specific
worker.

Specifically new Deploy/Initialisation of RStudio can be VERY slow
and CP is doing a `helm upgrade --wait` so it is blocking the worker:

https://github.com/ministryofjustice/analytics-platform-control-panel/blob/main/controlpanel/frontend/consumers.py#L109-L132

The default `--timeout` for `helm` is 300s/5 minutes:

https://helm.sh/docs/helm/helm_upgrade/#options

So I'm tweaking the worker liveliness probe to consider a worker stalled when
it didn't run something for 5 minutes and reduce the chance that a worker
container is restarted just because someone installed a tool.


## [2.4.4] - 2020-09-11
### Added
- Added liveliness probe to `worker` (Django Channels) container


## [2.4.3] - 2020-09-04
### Added
- Added readiness probe to `reverse-proxy` (nginx) container


## [2.4.2] - 2019-11-13
### Changed
- Pass Slack API token to migrations job to fix error


## [2.4.1] - 2019-11-07
### Changed
- **Deprecated** `secretEnv.AWS_ACCOUNT_ID`. Remove once `alpha` CP start to
  use version of CP which doesn't use `AWS_ACCOUNT_ID` anymore
- added `secretEnv.AWS_COMPUTE_ACCOUNT_ID` and `secretEnv.AWS_DATA_ACCOUNT_ID`
  so that we can distinguish the two (instead of having a single `AWS_ACCOUNT_ID`)


## [2.4.0] - 2019-11-11
### Changed
- Added Slack environment variables.


## [2.3.3] - 2019-11-04
### Changed
- Removed unused `host` label.


## [2.3.2] - 2019-10-25
### Changed
- Truncate `host` label to make sure it's less than 63
  characters once we move to new domain.


## [2.3.1] - 2019-10-04
### Removed
- Removed legacy `ENABLE_K8S_RBAC` flag. This is always `True` both in `dev`
  and `alpha` - no reason to keep it around


## [2.3.0] - 2019-09-30
### Changed
- Allow CP to read ingresses in apps namespace


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
