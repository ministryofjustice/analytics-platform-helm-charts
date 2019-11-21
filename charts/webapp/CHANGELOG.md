# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).



## [2.3.6] - 2019-11-20
### Changed
Update URL for crown logo


## [2.3.5] - 2019-11-04
### Changed
Removed unused `host` label


## [2.3.4] - 2019-10-25
### Changed
- Truncate `host` label to make sure it's less than 63
  characters once we move to new domain.
- Use `hostname` helper in NOTES.txt


## [2.3.3] - 2019-10-23
### Added
Added `Values.secretEnv.` to values.yaml and added secret that can be overridden by thh helm values override. This is to set dynamic env vars from AWS Parameters when deploying.


## [2.3.2] - 2019-10-22
### Added
Added `spec.selector.matchLabels` to deployment spec

## [2.3.1] - 2019-10-21
### Added
Added `priorityClassName` to pod spec
Updated `Deployment` APIGroup

## [2.3.0] - 2019-09-18
### Changed
Added HealthCheck option for deploy.json. Defaults to "/?healthz" for standard webapp and is "/healthz" in deploy.json for s3 proxy webapp deployment.


## [2.2.0] - 2019-08-27
### Changed
Add some security headers by default:

  - X-Content-Type-Options: nosniff
  - X-Frame-Options: deny

## [2.1.1] - 2019-08-23
### Changed
Bumped auth-proxy to version v5.2.1.
This version removes the non-standard `prompt=none`.
Also note that v5.2.0 introduced support for logic to log into kibana.

This shouldn't be a breaking change.

https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.1


## [2.1.0] - 2019-07-23
### Changed
Bumped `auth-proxy` to version [`v5.0.0`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.0.0).

## [2.0.0] - 2019-05-29
### Changed
Replaced fluentd with [fluent-bit].

fluent-bit is much lighter than fluentd which means the
logging sidecar container doesn't require much CPU/memory anymore.

Just for comparison the memory limit was 1000Mi while now it's at 50Mi.
Even that is conservatively "high" as it's not clear at this stage
how much resources fluent-bit will use in real-life scenarios.

We bumped the major version of the helm chart as the fluent-bit
resources values are now under `FluentBit.Resources` while previously they
were at the top level.

[fluent-bit]: https://docs.fluentbit.io/manual/v/1.1/


## [1.4.1] - 2019-05-21
### Changed
Bumped `auth-proxy` to version [`v4.0.1`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v4.0.1).

This version of the proxy reads the `X-Forwarded-For` header
but fixes the problem for websockets not able to read the headers.


## [1.4.0] - 2019-05-15
### Changed
- `auth-proxy` to version [`v3.1.0`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v3.1.0)


## [1.3.26] - 2019-05-13
### FluentD update repository
- Changed image repo from `gcr.io/google-containers/fluentd-elasticsearch` to `gcr.io/fluentd-elasticsearch/fluentd`
- Changed __fluentd__ image tag from `v2.4.0` to `v2.5.0`

## [1.3.25] - 2019-04-26
### Changed
- `auth-proxy` container don't run as `root` (bumped
  image tag `v0.1.9` => `v2.1.0`)


## [1.3.24] - 2019-04-02
### FluentD Upgrade cipher version
- Add `ssl_version TLSv1_2` to output configuration


## [1.3.23] - 2019-03-28
### FluentD Upgrade
- Set `target_type_key` to `true` in output configuration
- Set `log_es_400_reason` to `true` in output configuration
- Removed record transformer `types` key because it's not needed
- Changed FluentD image tag from `v2.0.4` to `v2.4.0`


## [1.3.22] - 2019-03-14
### FluentD Resources
- Increased cpu shares for fluentd. Requests and limits from 200m to 500m and 500m to 1 core respectively


## [1.3.21] - 2019-03-08
### FluentD Resources
- Increased cpu shares for fluentd


## [1.3.20] - 2019-01-31
### Changed
- Updated auth-proxy to v0.1.9:

   - For passwordless/app log-in, the visual style is customized for AP(https://github.com/ministryofjustice/analytics-platform-auth-proxy/pull/84)


## [1.3.19] - 2019-01-30
### Changed
- Updated auth-proxy to v0.1.8:
   - For passwordless log-in, adds an option to get a sign-in code (instead of a link) (#81)


## [1.3.18] - 2019-01-29
### Changed
- Updated auth-proxy from v0.1.4 to v0.1.7:
   - Customize the passwordless Auth0 prompt (#80)
   - Infinite loop bugfix for jupyter (#64)
   - Update dependencies and node for security fixes


## [1.3.17] - 2019-01-17
### Changed
- Added `host` label to deployment, ingress and service for use in
  LabelSelectors (useful for idle/unidle)


## [1.3.16] - 2018-10-19
### Changed
- Added `livenessProbe` to proxy container
- Added `readinessProbe` to webapp container
- Reduced proxy probe's `periodSeconds` to `2`
- Named all ports in `Deployment` (`proxy`/`webapp`) instead of using `http`
  for everything which could lead to confusion


## [1.3.15] - 2018-10-01
### Changed
- Update ingress object created by this chart to have a tls block (required by
  nginx + nlb ingress)
- Remove `path` from ingress object as it's not required (`/` is already the default)


## [1.3.14] - 2018-08-02
### Changed
- Update auth-proxy to v0.1.4, which fixes the login loop problem which happens
  when a user fails to login but is redirected back to the login page without an
  error message.


## [1.3.13] - 2018-07-17
### Changed
- Mismatched `FLUENT_ELASTICSEARCH_USERNAME` env var in configmap
- Set reload on failure to __false__.  See: https://github.com/uken/fluent-plugin-elasticsearch/issues/257#issuecomment-348946393


## [1.3.12] - 2018-07-16
### Changed
- After upgrading Elasticsearch. The webapp logs stopped working after a few days.
  This was due to deprecations with mappings and Elasticsearch 6 not supporting multiple mapping per index.
  See: https://www.elastic.co/guide/en/elasticsearch/reference/6.0/breaking-changes-6.0.html
  Setting `type_name` to resolve this as fluentd-elasticsearch-plugin sets two mappings.
- Switched to using the more stable Kubernetes tested fluentd image. Made config changes to deployment accordingly.
- Fixed "No Method" error on `time_nano` filter


## [1.3.11] - 2018-07-16
### Changed
- Use [auth-proxy `v0.1.3`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v0.1.3) which upgrades login-passwordless page to use `lock` library instead of `lock-passwordless`


## [1.3.10] - 2018-07-03
### Changed
- Add webapp service account for auditing purposes


## [1.3.9] - 2018-06-04
### Changed
- FluentD-Elasticsearch configuration. Increased buffer params, fixed no method errors from `time_nano` tag


## [1.3.8] - 2018-05-24
### Changed
- Increased memory resources from 256MB(default if unspecified) to 512MB
- Modified image repo tag to reflect quay.  Sorry (my bad)


## [1.3.7] - 2018-03-23
### Changed
- Use [auth-proxy `v0.1.2`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v0.1.2) which fixes
  a syntax error and adds a proper healthcheck endpoint
- Use `/healthz` endpoint added by above version of auth-proxy


## [1.2.0] - 2017-08-31
### Added
- webapps can assume an IAM role passed via `AWS.IAMRole` value, see README
- `CHANGELOG.md`


### Removed
- Unused AWS values: `AccessKeyId`, `SecretAccessKey` and `DefaultRegion`
