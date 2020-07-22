# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [2.1.1] - 2020-07-22
### Changed
- Maintainance release of the `idler` with updated tests dependencies
  and `kubernetes` dependency (client upgraded from `v9` to `v11`).
- The above newer version had some breaking changes but these shouldn't
  have any impact on the external API or behaviour of the `idler` (hence
  the patch release here), see PR: https://github.com/ministryofjustice/analytics-platform-idler/pull/194


See:
- Ticket: https://trello.com/c/dYDMOvny
- Ticket: https://trello.com/c/cQCHuIDP
- Kubernetes bump PR: https://github.com/ministryofjustice/analytics-platform-idler/pull/194


## [2.1.0] - 2019-11-13
### Changed
- Updated default schedule to run idler every Tuesday at 22:00 instead
  of running it every night. This is to reduce users' waiting time in the
  morning

Ticket: https://trello.com/c/6yyF8WFV


## [2.0.1] - 2019-06-24
### Fixed
- Fixed idling problems caused by some k8s resouces in an inconsistent state.
  This is achieved by patching them using strategic merge instead of JSONPatch.
- Also made the idling process more robust by catching all exceptions, logging
  them and continuing instead of interrupting the idling of the subsequent
  tools.
  NOTE: The process will still return a non-zero status code so we know idling
  of some of the tools didn't work.


Idler PR: https://github.com/ministryofjustice/analytics-platform-idler/pull/101
Part of ticket: https://trello.com/c/vr4LPcde/241-investigate-fix-idling-unidling-problems-caused-by-k8s-cluster-upgrade-new-version-of-k8s


## [2.0.0] - 2019-03-29
### Changed
- Use `idler` to `v1.0.0`:
  - adds `mojanalytics.xyz/replicas-when-unidled` annotation with number of
    replicas desired at the time of udling. This is used by `unidler`
  - `mojanalytics.xyz/idled-at` only contains time when app was idled,
    nothing else
  - renamed env var `RSTUDIO_ACTIVITY_CPU_THRESHOLD` =>
    `CPU_ACTIVITY_THRESHOLD`
  - internal refactorings
  - `labelSelector` defaults to `mojanalytics.xyz/idleable=true` now
    (in `idler`)
  - See PR: ministryofjustice/analytics-platform-idler#68
- added `app=$RELEASE_NAME` to job's pods so that we can see logs and
  investigate things much more easily
- `labelSelector` defaults to `mojanalytics.xyz/idleable=true` now (in helm
  chart)
- `logLevel` defaults to `DEBUG`. We want to see what's going on unless
  we explicit silence it for whatever reason.


## [1.2.4] - 2019-02-18
### Changed
Bump to 0.5.2 to get bugfix for targetport


## [1.2.3] - 2019-02-18
### Changed
Bump image version to 0.5.1 to pick up bugfix for incorrect service update


## [1.2.2] - 2019-02-14
### Changed
Corrected verb for read services
Remove unused permissions for ingresses


## [1.2.1] - 2019-02-05
### Changed
Added permission to read and patch services


## [1.2.0] - 2019-01-29
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
