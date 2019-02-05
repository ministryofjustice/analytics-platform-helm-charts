# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [1.2.1] - 2018-02-05
### Changed
Added permission to read and patch services

## [1.2.0] - 2018-01-29
### Changed
Idling was achieved by disabling the app ingress and adding the app hostname to the unidler ingress.
If multiple users unidled at the same time, there could be a race condition when removing the hostnames from the unidler ingress.
This change does away with editing ingresses altogether and edits only the app service. By changing the service to what is essentially a CNAME forwarding to the unidler, requests to the app host are handled by the unidler.

## [1.1.0] - 2018-10-10
### Changed
- Add support for idling Jupyter-lab

## [1.0.1] - 2018-10-09
### Changed
- Using a new version of idler (`v0.3.1`) with more support for cpu metrics in
  microcorescores:
  https://github.com/ministryofjustice/analytics-platform-idler/pull/20

## [1.0.0] - 2018-10-03
### Changed
- Using a new version of idler (`v0.3.0`) with more support for cpu metrics in
  nanocores:
  https://github.com/ministryofjustice/analytics-platform-idler/pull/16


## [0.2.4] - 2018-04-27
### Changed
- Using a new version of idler (`v0.2.4`) with more debug logging: https://github.com/ministryofjustice/analytics-platform-idler/pull/11

### Added
- Added `logLevel` value and setting `LOG_LEVEL` in the job


## [0.2.3] - 2018-04-25
### Fixed
- Added permissions required to list pods and pods' metrics
- Fixes logging

### Changed
- Better handling of unhealthy pods (missing metrics data)
- See [related PR](https://github.com/ministryofjustice/analytics-platform-idler/pull/10)


## [0.2.2] - 2018-04-25
### Fixed
- Fixes Docker image missing `metrics_api` package
- See [PR](https://github.com/ministryofjustice/analytics-platform-idler/pull/9)


## [0.2.1] - 2018-04-20
### Fixed
- Fixes idler incorrectly idling RStudio instances using more CPU
  than the threshold (`RSTUDIO_ACTIVIY_CPU_THRESHOLD`).
  See [PR with fix](https://github.com/ministryofjustice/analytics-platform-idler/pull/8)
- Don't use `latest` as idler image tag as it's not predictable


## [0.2.0] - 2018-03-16
### Changed
- Add env var `RSTUDIO_ACTIVIY_CPU_THRESHOLD` to configure what counts as an
  active RStudio deployment and so whether to skip idling.
- Add permission to read from Resource Metrics API
