# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


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
