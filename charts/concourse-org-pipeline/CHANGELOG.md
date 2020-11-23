# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [0.3.0] - 2020-11-23
### Added
Support for pulling "set-pipeline" job image container using credentials.
Courtesy of `imagePullSecrets` value, which defaults to `[]`, e.g. pulling
image from public DockerHub without authenticating.

## [0.2.5] - 2019-09-03
### Added
Placeholder secret `alanTuringInstitute` to `ipRanges` to support
ip whitelisting for them

## [0.2.4] - 2019-07-12
### Changed
Add parameter IAM role secrets

## [0.2.3] - 2019-05-03
### Changed
Update version for org resource to build docker images for airflow tasks on PR


## [0.2.2] - 2019-03-27
### Changed
Changed release versions of webhook-dispatcher and org-scanner releases
This is to allow tests to be run on PRs for DAGs and Lookup repos

## [0.2.1] - 2019-03-05
### Changed
Changed release versions of webhook-dispatcher and org-scanner releases
This is to allow us to use the command line with parameters for concourse

## [0.2.0] - 2019-02-28
### Added
Added `secrets.lookup-access-key-id` and `secrets.lookup-secret-access-key` secrets, intended to give access to lookup s3 buckets.
This is to allow concourse to pass creds to docker container to write to the `moj-analytics-lookup-tables` bucket

## [0.1.8] - 2018-10-29
### Fix log shipping
 - Modified image tag from  `0.3.9` to `0.5.1` - See [Fix-webapp-log-shipping](https://github.com/ministryofjustice/analytics-platform-concourse-github-org-resource/pull/10)

## [0.1.6] - 2018-07-30
### Added
Added `secrets.iam-list-roles-key-id` and `secrets.iam-list-roles-secret-access-key` secrets, intended to be overridden in config repo.
This is to allow concourse to list aws iam roles.

## [0.1.5] - 2018-05-17
### Added
Added `secrets.cpanel-api-user` and `secrets.cpanel-api-password` secrets, intended to be overridden in config repo.
This is to authenticate with the Control Panel API.


## [0.1.4] - 2018-05-11
### Added
Added `secrets.cpanel-api-url` secret, intended to be overridden in config repo.
This contains the base URL of the Control Panel API.

### Changed
Bumped the version of the Concourse Github Org resource to 0.3.9
Reduced org polling interval to once every 24 hours - checks are intended to be
triggered via Github webhook instead.


## [0.1.3] - 2018-04-26
### Added
Added IP range secrets for DOM1, QUANTUM and 102PF for use in webapp
deployment IP restriction parameters.

### Changed
Modified webapp deployment pipeline to include new task to read deployment
parameters from a `deploy.json` file in the webapp repo and pass those values to
the webapp helm chart.
