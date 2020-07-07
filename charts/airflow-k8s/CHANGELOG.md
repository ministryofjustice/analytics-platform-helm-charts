# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.3.3] - 2020-07-07
### Changed
- Updated airflow image to apache/airflow/1.10.10


## [0.3.2] - 2019-11-25
### Changed
- Updated airflow image to apache/airflow/1.10.6


## [0.3.1] - 2019-04-30
### Changed
- Set git-sync image to an image in quay

See
- Image: quay.io/mojanalytics/git-sync:0.0.1


## [0.3.0] - 2019-04-29
### Changed
Bumped Airflow to version `1.10.3`.

See:
- Dockerfile changes: https://github.com/ministryofjustice/analytics-platform-airflow-docker-image/pull/5
- Airflow Changelog: https://github.com/apache/airflow/blob/master/CHANGELOG.txt


## [0.2.1] - 2019-03-20
### Changed
- Set git-sync repo to a kube secret as it now contains access token for github


## [0.2.0] - 2019-02-25
### Changed
- Upgraded `redis` chart dependency `3.6.4` => `6.1.3`
  - This upgrade `redis` version `4.0.10` => `4.0.13`
- Updated values to reflect helm chart upgrade
- Enabled `NetworkPolicy` so that only Airflow webserver
  can access redis
- Only download Redis docker image if it's not already present
  in the k8s node (`IfNotPresent`).
  Image tag is not `latest` so no reason to make unnecessary
  requests and waste time.


## [0.1.1] - 2019-02-19
### Security
- Fixed problem where some of the authentication requests were done over
  **non-secure** HTTP connection.
- added `airflow.config.webserver.enable_proxy_fix` which
  by default is `True` but can be changed if necessary
- See:
  - Airflow issue: [`AIRFLOW-3137`](https://issues.apache.org/jira/browse/AIRFLOW-3137)
  - Airflow fix: [`PR #3983`](https://github.com/apache/airflow/pull/3983)

**NOTE**: You should only enable the `ProxyFix` middleware when running
Airflow behind a trusted proxy (AWS ELB, nginx, etc.).

### Cosmetic
- Added some newlines in `airflow` Configmap / `airflow.cfg` to
  improve readability and reduce time necessary to find things in it.


## [0.1.0] - 2019-01-30
### Features
- Bumped Airflow version to [`1.10.2`] (docker image tag
  is [`1.10.2-2`])
- Added `appVersion` to chart metadata to improve visibility of
  which Airflow version the chart is using.

### Improvements
- Use user-provided `.Values.airflow.image.pullPolicy`
  value in all places where `airflow` docker image
  is used
- Bumped `bash` image tag to latest stable and be explicit
  about tag instead of using `latest`
- Bumped `gcr.io/google_containers/hyperkube` tag from
  `v1.11.2` => `v1.11.7`
- Set `git-sync`'s `pullPolicy` to `IfNotPresent` as
  we're not using `latest` as image tag

### Fixed
- `git-sync` pod was using wrong value as pullPolicy

### Cosmetic
- Consistency in the way we have `image`, `tag` and
  `pullPolicy` in the same order and next to each other


[`1.10.2`]: https://github.com/ministryofjustice/analytics-platform-airflow-docker-image/pull/3
[`1.10.2-2`]: https://github.com/ministryofjustice/analytics-platform-airflow-docker-image/pull/4


## [0.0.9] - 2019-02-05
### Fixed
Chart installation when chart was previously installed and purged.
This was caused by `init-airflow-ns` job that annotate the
`airflow` namespace.

Techical details: The problem was that the `Job` created on new
install (`else` statement) was not idempotent because it was
missing the `--overwrite` flag (which the `if` block had).

I've simplified the init job template to factor all the
common parts and have a smaller `if` just for the
`helm.sh/hook` annotation.


## [0.0.8] - 2019-01-25
### Changed
Removed admin credentials from scheduler's init container definition.
Moved them in the secret so that if someone describe the pod will
not see the admin username/password/email


## [0.0.7] - 2019-01-25
### Changed
Moved OAuth secrets from ConfigMap to Secret. These are sensitive and it's
a best-practice to keep them in a secret.


## [0.0.6] - 2018-09-13
### Fixed
Fixed URLs in email notifications.


## [0.0.5] - 2018-09-12
### Fixed
SMTP secrets were not passed to the pods created by the `KubernetesPodOperator`.
This is the pod which sends the email on retry/fail so emails were not sent.


## [0.0.4] - 2018-09-07
### Added
Support for SMTP configuration. This allows sending of emails, e.g. on retries
failure, etc...


## [0.0.1] - 2018-06-15
### Added
First cut of Airflow helm chart configured to run tasks in new pods.

**NOTE**: This is heavily work in progress and probably not working.
