# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


## [v3.1.3] - 2019-02-14
### Changed
Audit clusterrole rules, remove unused verbs

## [v3.1.2] - 2019-01-31
### Changed
Fix api group name for core api group - should be ""

## [v3.1.1] - 2019-01-31
### Changed
Grant unidler permission to list and patch services

## [v3.1.0] - 2019-01-29
### Changed
Unidling was achieved by re-enabling the app ingress and removing the app hostname from the unidler ingress.
This could result in a race condition when multiple apps were unidled at the same time.
This change does away with modifying ingresses and instead unidles an app by restoring the service to a load-balancer for the app pods.

## [v3.0.0] - 2018-10-10
### Changed
- Changed Docker image to use [`go-unidler`](https://github.com/ministryofjustice/analytics-platform-go-unidler) instead of ["old" `unidler` (Python)](https://github.com/ministryofjustice/analytics-platform-unidler)
- Use `/healthz` endpoint provided by `go-unidler` to check readiness/liveness.
- Increased `replicaCount` from `1` to `3` as `go-unidler` is stateless and unidling is idempotent
- `ingress.className` defaults to `"nginx"` again (not `"istio"`)
- removed unused values (`logLevel`)
- added `appVersion` to `Chart.yaml`


## [v2.0.0] - 2018-09-26
### Changed
Added (optional) TLS block in ingress resource.
You can set the `ingress.addTlsBlock` value to `false` if your
ingress-controller doesn't work when ingress resources have this block (e.g.
[traefik](https://traefik.io) doesn't seem to work)


## [v1.0.0] - 2018-09-25
### Changed
Use Host header instead of X-Forwarded-Host to determine pod to unidle.

This is required to work with Istio/Envoy.


## [0.2.0] - 2018-09-25
### Changed
- Added `ingress.className` value to allow change of ingress controller used
  to handle ingress resources.
- Set docker image pull policy to `IfNotPresent` as we shouldn't need to
  re-download the docker image all the time as we pin the version
