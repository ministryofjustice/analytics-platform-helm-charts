# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.6.0] - 2020-11-13

- Adds the ability to specify image pullSecrets for container authentication

## [0.5.2] - 2020-06-15

- Bumped auth-proxy from `v5.2.5` to `v5.2.6`.

  This is a maintenance release which upgrades some of its dependencies.
  Few of these new dependencies also fix some potential security
  vulnerabilities.

  See Release Notes for more: <https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.6>

## [0.5.1] - 2020-01-31

- Bumped auth-proxy from `v5.2.1` to `v5.2.4`.

  This version updates some of the dependencies, [including
  `handlebars` `4.7.2`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/pull/214)
  which fixes a security vulnerability.

  See:
  - <https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.4>
  - <https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.3>

## [0.5.0] - 2020-01-21

- Give containers fixed cpu and memory to guarantee QoS

## [0.4.6] - 2019-11-04

- Diffent approach to long `host` labels.
- Truncate to 63 chars was not good enough if the 63th character happened to be a dot (`.`) because labels can't end with a dot.

To maintain compatibility with existing clusters, charts
and unidler:

- If the length of `host` label value is <= 63 the value
  is the full host (as before)
- If the full host if longer than 63 characters we split
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

- Truncate `host` label to make sure it's less than 63
  characters once we move to new domain.

## [0.4.4] - 2019-10-21

- Added `priorityClassName` to pod spec
Updated `Deployment` APIGroup

## [0.4.3] - 2019-08-23

- Bumped auth-proxy to version v5.2.1.
  This version removes the non-standard `prompt=none`.
  Also note that v5.2.0 introduced support for logic to log into kibana.

  <https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.1>

## [0.4.2] - 2019-06-05

- Bumped `quay.io/mojanalytics/datascience-notebook` to version [`v0.6.7`](https://github.com/ministryofjustice/analytics-platform-jupyter-notebook/releases/tag/v0.6.7).
- Adds flake8 and python black to show pep8 errors and add a file formatter.

## [0.4.1] - 2019-05-22

- Bumped `auth-proxy` to version [`v4.0.1`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v4.0.1).
- Remove support for `NICKNAME_RE` and replaces it with a simple equality check with the `USER` environment variable.

## [0.4.0] - 2019-05-15

- Bump `auth-proxy` to version [`v3.1.0`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v3.1.0)

## [0.3.2] - 2019-04-26

- Change `auth-proxy` container to not run as root user

## [0.3.1] - 2019-04-25

- Set auth-proxy name regex to exact match of username

## [0.3.0] - 2019-04-04

- Added `"mojanalytics.xyz/idleable": "true"` label to pods. This will
  make the "don't idle if CPU usage is above X%" logic work again.

## [0.2.1] - 2019-03-28

- Update version of auth-proxy to one that supports tunneling.
- Allow people to tunnel dash apps.

## [0.2.0] - 2019-03-15

- Added `host=` label to everything, this will help simplify the idler
- Simplified installation/upgrade instructions in README
- Added `host` template to remove duplication
- Added NOTES.txt so that jupyter URL will be shown after installation

## [0.1.17] - 2019-03-07

- Run `usermod` in Docker build to avoid it being run on startup. This will
improve startup time for users.

## [0.1.16] - 2018-12-13

- Revert previous change setting uid as 1001 at the pod level. We have
put this back into the image as we found a couple of issues with this approach

## [0.1.14] - 2018-11-29

- Jupyter-lab container will run as uid 1001 to match r-studio. This is
  no longer done by the image itself
- Re-added `livenessProbe` and `readinessProbe` from Jupyter container

## [0.1.13] - 2018-11-28

- Removed `livenessProbe` and `readinessProbe` from Jupyter container

## [0.1.12] - 2018-11-19

- Modified `livenessProbe` and `readinessProbe` to type `exec` for Jupyter container

## [0.1.11] - 2018-11-14

- Adjusted `livenessProbe` and `readinessProbe` to bigger values for Jupyter container

## [0.1.10] - 2018-10-19

- Added `livenessProbe` to be sure pods are terminated when unhealthy
- Reduced probes' `periodSeconds` from `5` to `2`
- Renamed ports in `Deployment` to `proxy`/`jupyter` instead of using `http`
  for everything which could lead to confusion
- Fixed indentation in `Deployment` YAML file

## [0.1.9] - 2018-10-16

- Updated image tag to v0.6.0, which adds geospatial functionality, support for s3 access in spark, and the latest version of jupyter lab.

## [0.1.8] - 2018-10-05

- Add `idleable=true` annoation to the deployment. This is to allow opt-in to
  the idler.

## [0.1.7] - 2018-08-15

- Added tls config to ingress.  This is required for tls termination with the nginx ingress controller. See [Trello](https://trello.com/c/M1snktNZ)
- Auth-proxy image tag from 0.1.4 to 0.1.3 while investigating ssl redirect issues

## [0.1.6] - 2018-08-10

- Update datascience-notebook image tag from 0.3.3 to 0.4.0. Relates to [PR](https://github.com/ministryofjustice/analytics-platform-jupyter-notebook/pull/8)

## [0.1.5] - 2018-08-02

- Update auth-proxy to v0.1.4, which fixes the login loop problem which happens
  when a user fails to login but is redirected back to the login page without an
  error message.

## [0.1.4] - 2018-07-17

- Update the image tag from 0.3.2 to 0.3.3

## [0.1.3] - 2018-5-18

- Profile failed to auto load alias. Amended `pip-user-home.sh` to create `.bash_aliases` file which `.bashrc` checks exists
- [Trello](https://trello.com/c/NKz0zS0m)

## [0.1.2] - 2018-04-10

- Jupyter Auth0 CallBack URL: Fix auth proxy callback envvar to point to the correct endpoint

## [0.1.1] - 2018-02-15

- Modifying Image tag to point to latest image

## [0.1.0] - 2018-02-08

- Initial chart development
- Bash Profile job
