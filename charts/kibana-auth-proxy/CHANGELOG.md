# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [2.0.1] - 2019-07-04
### Changed
Patched security vulnerabilities in dependencies

## [2.0.0] - 2018-09-27
### Changed
Added (optional) TLS block in ingress resource.
You can set the `ingress.addTlsBlock` value to `false` if your
ingress-controller doesn't work when ingress resources have this block (e.g.
[traefik](https://traefik.io) doesn't seem to work)


## [1.1.3] - 2018-05-09
### Changed
Use [`kibana-auth-proxy` v1.1.2](https://github.com/ministryofjustice/analytics-platform-kibana-auth-proxy/releases/tag/v1.1.2).

This version of the proxy bumps some dependencies and fixes
[hoek vulnerability](https://nvd.nist.gov/vuln/detail/CVE-2018-3728).


## [1.1.2] - 2018-03-19
### Fixed
- Fixed redirect loop caused by `nginx.ingress.kubernetes.io/force-ssl-redirect`
annotation on ingress resource


## [1.1.1] - 2018-03-16
### Changed
- Disable *silent* SSO by using `kibana-auth-proxy` `v1.1.1`

See: https://github.com/ministryofjustice/analytics-platform-kibana-auth-proxy/pull/2


## [1.1.0] - 2018-03-14
### Changed
- Fixed proxy version/tag instead of using `latest`
- Use newly added `/healthz` endpoint for healthcheck
- Proxy was updated to:
  - use Auth0 hosted login page instead of local login page
  - enabled silent SSO enabled
  - session cookies expire after 1 hour
  - Other changes, see: https://github.com/ministryofjustice/analytics-platform-kibana-auth-proxy/pull/1
