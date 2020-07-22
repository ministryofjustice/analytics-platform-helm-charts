# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.1.7] - 2020-07-22
### Added
- Added an alert for KubeDNS errors


## [0.1.4] - 2020-06-15
### Changed
Bumped auth-proxy from `v5.2.5` to `v5.2.6`.

This is a maintenance release which upgrades some of its dependencies.
Few of these new dependencies also fix some potential security
vulnerabilities.

See Release Notes for more: https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.6


## [0.1.3] - 2020-01-31
### Changed
Bumped auth-proxy from `v5.2.1` to `v5.2.4`.

This version updates some of the dependencies, [including
`handlebars` `4.7.2`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/pull/214)
which fixes a security vulnerability.

See:
- https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.4
- https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.3


## [0.1.2] - 2019-08-23
### Changed
Bumped auth-proxy to version `v5.2.1`.
This version removes the non-standard `prompt=none`.
Also note that `v5.2.0` introduced support for logic to log into kibana.

This shouldn't be a breaking change.

https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.1


## [0.1.1] - 2019-03-18
### Upstream Chart Migration/Initial Commit
- Removed duplicate alerting rules
- Modified custom alerts to display message field like operator alerts


## [0.1.0] - 2019-02-05
### Upstream Chart Migration/Initial Commit
- Initial commit
- Migrated our deployment from [CoreOS's deprecated chart](https://github.com/coreos/prometheus-operator/tree/master/helm) to [Helm stable repo chart](https://github.com/helm/charts/tree/master/stable/prometheus-operator)
- Secured [Prometheus](https://prometheus.services.dev.mojanalytics.xyz) and [AlertManager](https://alertmanager.services.dev.mojanalytics.xyz) front-ends with [auth-proxy](https://github.com/ministryofjustice/analytics-platform-auth-proxy)
- Migrated Dashboard templates to Grafana 5.4.x spec
- Migrated Rules, Alerts and Dashboards from previous deployment
- Added `PodSecurityPolicy` in preparation for [Trello](https://trello.com/c/0mfKXhjp)
