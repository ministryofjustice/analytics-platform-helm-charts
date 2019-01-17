# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).



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
