# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [1.0.0] - 2020-12-10
### Changed
- use `allspark` Docker image by default (`v1.1.1`)
- this *may* break things in new and exciting ways hence
  the major version bump
- use image hosted in AWS ECR registry


## [0.5.4] - 2020-12-11
### Changed
- Running jupyter deployment with arg ` --ContentsManager.allow_hidden=True` to allow users to see hidden files in the file browser side panel.


## [0.5.3] - 2020-11-25
### Changed
- Removed unused `Job` to tweak bash profile (container started bash but
  wasn't doing anything anymore (see commit below)
- Removed unused `ConfigMap` which was containing content of `files/*`
  files now removed as well (see commit below)

This should be a non-breaking change but we can save 1 docker image pull
for this container which doesn't do anything anymore

Commit removing script execution in job: https://github.com/ministryofjustice/analytics-platform-helm-charts/commit/e01562d5904cdcb12f1aa2ec9e22f13ccda90542#diff-38edf99fd46462465404fefea8ac5bd0372e0963c7884c2b9ebfe0a88912c2f7


## [0.5.2] - 2020-06-15
### Changed
Bumped auth-proxy from `v5.2.5` to `v5.2.6`.

This is a maintenance release which upgrades some of its dependencies.
Few of these new dependencies also fix some potential security
vulnerabilities.

See Release Notes for more: https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.6


## [0.5.1] - 2020-01-31
### Changed
Bumped auth-proxy from `v5.2.1` to `v5.2.4`.

This version updates some of the dependencies, [including
`handlebars` `4.7.2`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/pull/214)
which fixes a security vulnerability.

See:
- https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.4
- https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.3


## [0.5.0] - 2020-01-21
### Changed
Give containers fixed cpu and memory to guarantee QoS


## [0.4.6] - 2019-11-04
### Changed
Diffent approach to long `host` labels.
Truncate to 63 chars was not good enough if the 63th
character happened to be a dot (`.`) because labels
can't end with a dot.

To maintain compatibility with existing clusters, charts
and unidler:
- if the length of `host` label value is <= 63 the value
  is the full host (as before)
- if the full host if longer than 63 characters we split
  by dots and we only use the part of the host before
  the first dot

Labels changes:
- Added `unidle-key` label to resources selected by the unidler
  to be more explicit than just using `host`.
- `host` label stays there as it's used in old `alpha` by
  unidler. We'll remove once `alpha` is retired
- `host` label is only kept for `Ingress`, `Deployment` and
  `Service` as there are the only `host` labels used by unidler
  (the rest were just added for consistency for human debugging
  but could lead to confusion, so removing)


## [0.4.5] - 2019-10-25
### Changed
- Truncate `host` label to make sure it's less than 63
  characters once we move to new domain.


## [0.4.4] - 2019-10-21
### Added
Added `priorityClassName` to pod spec
Updated `Deployment` APIGroup


## [0.4.3] - 2019-08-23
### Changed
Bumped auth-proxy to version v5.2.1.
This version removes the non-standard `prompt=none`.
Also note that v5.2.0 introduced support for logic to log into kibana.

This shouldn't be a breaking change.

https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.1


## [0.4.2] - 2019-06-05
### Changed
Bumped `quay.io/mojanalytics/datascience-notebook` to version [`v0.6.7`](https://github.com/ministryofjustice/analytics-platform-jupyter-notebook/releases/tag/v0.6.7).

This version adds flake8 and python black to show pep8 errors and add a file formatter.


## [0.4.1] - 2019-05-22
### Changed
Bumped `auth-proxy` to version [`v4.0.1`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v4.0.1).

This version removes support for `NICKNAME_RE` and replaces it with
a simple equality check with the `USER` environment variable.


## [0.4.0] - 2019-05-15
### Changed
- `auth-proxy` to version [`v3.1.0`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v3.1.0)


## [0.3.2] - 2019-04-26
### Changed
- `auth-proxy` container don't run as root user


## [0.3.1] - 2019-04-25
### Changed
- Set auth-proxy name regex to exact match of username


## [0.3.0] - 2019-04-04
### Changed
- Added `"mojanalytics.xyz/idleable": "true"` label to pods. This will
  make the "don't idle if CPU usage is above X%" logic work again.


## [0.2.1] - 2019-03-28
### Changed
- Update version of auth-proxy to one that supports tunneling.
- Allow people to tunnel dash apps.


## [0.2.0] - 2019-03-15
### Changed
- added `host=` label to everything, this will help simplify the idler
- simplified installation/upgrade instructions in README
- added `host` template to remove duplication
- added NOTES.txt so that jupyter URL will be shown after installation


## [0.1.17] - 2019-03-07
### Changed
- Run `usermod` in Docker build to avoid it being run on startup. This will
improve startup time for users.


## [0.1.16] - 2018-12-13
### Changed
- Revert previous change setting uid as 1001 at the pod level. We have
put this back into the image as we found a couple of issues with this approach


## [0.1.14] - 2018-11-29
### Changed
- Jupyter-lab container will run as uid 1001 to match r-studio. This is
  no longer done by the image itself
- Re-added `livenessProbe` and `readinessProbe` from Jupyter container


## [0.1.13] - 2018-11-28
### Changed
- Removed `livenessProbe` and `readinessProbe` from Jupyter container


## [0.1.12] - 2018-11-19
### Changed
- Modified `livenessProbe` and `readinessProbe` to type `exec` for Jupyter container


## [0.1.11] - 2018-11-14
### Changed
- Adjusted `livenessProbe` and `readinessProbe` to bigger values for Jupyter container


## [0.1.10] - 2018-10-19
### Changed
- Added `livenessProbe` to be sure pods are terminated when unhealthy
- Reduced probes' `periodSeconds` from `5` to `2`
- Renamed ports in `Deployment` to `proxy`/`jupyter` instead of using `http`
  for everything which could lead to confusion
- Fixed indentation in `Deployment` YAML file


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
