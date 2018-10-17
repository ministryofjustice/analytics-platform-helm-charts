# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.1.9] - 2018-10-16
### Changed
- Updated image tag to v0.6.0, which adds geospatial functionality, support for s3 access in spark, and the latest version of jupyter lab.


## [0.1.8] - 2018-10-05
### Added
- Add `idleable=true` annoation to the deployment. This is to allow opt-in to
  the idler.

## [0.1.7] - 2018-08-15
### Changed
- Added tls config to ingress.  This is required for tls termination with the nginx ingress controller. See [Trello](https://trello.com/c/M1snktNZ)
- Auth-proxy image tag from 0.1.4 to 0.1.3 while investigating ssl redirect issues

## [0.1.6] - 2018-08-10
## jupyter-tag-3
- Update datascience-notebook image tag from 0.3.3 to 0.4.0. Relates to [PR](https://github.com/ministryofjustice/analytics-platform-jupyter-notebook/pull/8)

## [0.1.5] - 2018-08-02
## Changed
- Update auth-proxy to v0.1.4, which fixes the login loop problem which happens
  when a user fails to login but is redirected back to the login page without an
  error message.

## [0.1.4] - 2018-07-17
## Jupyter Tag
-Updating the image tag from 0.3.2 to 0.3.3

## [0.1.3] - 2018-5-18
## Package Home
- Profile failed to auto load alias. Amended `pip-user-home.sh` to create `.bash_aliases` file which `.bashrc` checks exists
- [Trello](https://trello.com/c/NKz0zS0m)

## [0.1.2] - 2018-04-10
## Jupyter Auth0 CallBack URL
-  Fixing auth proxy callback envvar to point to the correct endpoint

## [0.1.1] - 2018-02-15
## Image Tag
- Modifying Image tag to point to latest image

## [0.1.0] - 2018-02-08
### Initial Commit
- Initial chart development
- Bash Profile job
