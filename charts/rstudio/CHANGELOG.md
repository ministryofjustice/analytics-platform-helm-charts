# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [3.0.10] - 2021-02-03

-  Change chown home to a config map script

## [3.0.9] - 2021-02-03

- Update the Docker image to [4.0.3.5](https://github.com/ministryofjustice/analytics-platform-rstudio/releases/tag/4.0.3-5)
  - Adds libdunits2, libgeos and lib proj for R libraries
  - Adds OpenSSH client for git clones

## [3.0.8] - 2021-02-04

- Add an init container to change the user home on boot.
  We are using an init container as it will always finish no matter how long it takes.
  Some user homes take a long time to chown as they contain a lot of conda packages.
  We don't mind which group the home files are in as they can be both `users` and `staff` depending on which tool created it.

## [3.0.7] - 2021-01-27

- Update the Docker image to [4.0.3-4](https://github.com/ministryofjustice/analytics-platform-rstudio/releases/tag/4.0.3-4)

## [3.0.6] - 2021-01-27

- Update the Docker image to [4.0.3-4](https://github.com/ministryofjustice/analytics-platform-rstudio/releases/tag/4.0.3-4)
- Revert the USERNAME change, as SoftNAS mounts don't seem to like the rstudio user

## [3.0.5] - 2021-01-25

- Revert the auth-proxy USERNAME change

## [3.0.4] - 2021-01-14

- Set the user to rstudio as per default
  - This will stop the rstudio-sever container from chown'ing the home directory which can take an enormouse amount of time.

## [3.0.3] - 2021-01-13

- Update the Docker image to [4.0.3-2](https://github.com/ministryofjustice/analytics-platform-rstudio/releases/tag/4.0.3-2)

## [3.0.2] - 2021-01-07

- Increase the initial delay on both the livenessProbe and readinessProbe to stop the container restarting before it's has a chance to initialize

## [3.0.1] - 2021-01-07

- Adds the secure-cookie-key to the server so that auth-proxy can talk to RStudio
- Update the Docker container to [4.0.3-1](https://github.com/ministryofjustice/analytics-platform-rstudio/releases/tag/4.0.3-1)

## [3.0.0] - 2021-01-06

- Update RStudio to 4.0.3
- Removes Conda from the image
 For a full change log see the [Docker release](https://github.com/ministryofjustice/analytics-platform-rstudio/releases/tag/4.0.3)
- Remove the init container that's no longer required
- Remove the command pointing to the custom script that no longer exists (we now use upstream)

## [2.2.6] - 2020-06-15

- Bumped auth-proxy from `v5.2.5` to `v5.2.6`.

This is a maintenance release which upgrades some of its dependencies.
Few of these new dependencies also fix some potential security
vulnerabilities.

See Release Notes for more: <https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.6>

## [2.2.5] - 2020-05-06

- Install nbstripout with conda instead of pip
- Changed tag to 1.2.1335-r3.5.1-python3.7.1-conda-10

## [2.2.4] - 2020-03-23

- Reverting old code
- Changed tag to 1.2.1335-r3.5.1-python3.7.1-conda-6

## [2.2.3] - 2020-03-20

- Changed tag to 1.2.1335-r3.5.1-python3.7.1-conda-5

## [2.2.2] - 2020-03-19

Changed tag to 1.2.1335-r3.5.1-python3.7.1-conda-4

## [2.2.1] - 2020-01-31

- Bumped auth-proxy from `v5.2.1` to `v5.2.4`.

This version updates some of the dependencies, [including
`handlebars` `4.7.2`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/pull/214)
which fixes a security vulnerability.

See:

- <https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.4>
- <https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.3>

## [2.2.0] - 2020-01-21

- Give containers fixed cpu and memory to guarantee QoS

## [2.1.5] - 2019-10-30

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

## [2.1.4] - 2019-10-25

- Truncate `host` label to make sure it's less than 63
  characters once we move to new domain.
- Added labels to `ServiceAccount` for consistency

## [2.1.3] - 2019-10-23

- Added `spec.selector.matchLabels` to deployment spec

## [2.1.2] - 2019-10-21

- Added `priorityClassName` to pod spec
- Updated `Deployment` APIGroup
- Increased requested memory from `5GI` to `8GI`

## [2.1.1] - 2019-08-23

- Bumped auth-proxy to version v5.2.1.
- This version removes the non-standard `prompt=none`.
- Also note that v5.2.0 introduced support for logic to log into kibana.

- This shouldn't be a breaking change.
- <https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.1>

## [2.1.0] - 2019-07-08

- Using newer docker image with RStudio 1.2.
  The rest should be the same, same R version, still using conda, etc...

See: <https://blog.rstudio.com/2019/04/30/rstudio-1-2-release/>

## [2.0.1] - 2019-05-21

- Bumped `auth-proxy` to version [`v4.0.1`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v4.0.1).
  This version of the proxy reads the `X-Forwarded-For` header but fixes the problem for websockets not able to read the headers.

## [2.0.0] - 2019-05-20

- Using `auth-proxy` [`v4.0.0`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v4.0.0)
instead of the special `rstudio-auth-proxy`.

- The logic to add the RStudio secure cookie is now in the `auth-proxy` so we don't need to maintain two separate auth proxies.

## [1.10.0] - 2019-05-15

- Use `rstudio-auth-proxy` [`v2.0.0`](https://github.com/ministryofjustice/analytics-platform-rstudio-auth-proxy/releases/tag/v2.0.0).

## [1.9.0] - 2019-03-10

- Version of RStudio image with conda (r3.5.1-py3.7-conda-1)

  New image able to recover from bad conda install better

## [1.8.0] - 2019-03-15

- Added `"mojanalytics.xyz/idleable": "true"` label to pods. This will
  make the "don't idle if CPU usage is above X%" logic work again.

## [1.7.0] - 2019-03-15

- added `host=` label to everything, this will help simplify the idler
- don't set unused `TOOLS_DOMAIN` environment variable
- simplified installation/upgrade instructions in README
- added `host` template to remove duplication
- removed unused `name` template

## [1.6.0] - 2019-02-14

- Version of RStudio image with conda (r3.5.1-py3.7-conda)
- it doesn't point at the cran proxy
- does initial setup in an init container
- has a rstudio conda environment
- maintains support for projects still using packrat

## [1.5.8] - 2018-10-17

- Version of rstudio image (3.4.2-6), it now points at the cran proxy, has boto3
  installed by default and is able to build udunits2 r package
- Change pull policy for rstudio container to be 'IfNotPresent' instead of 'Always'

## [1.5.7] - 2018-10-17

- Don't hardcode target port in `Service`, use provided value
- Renamed ports in `Deployment` to be more explicit and avoid any possible
  confusion (they're now called `proxy` and `rstudio` respectively)
- Increaded probes' frequency by reduced `periodSeconds` to `2` from `5`,
  this could help with the user experience as k8s could respond to problems
  more promptly.
- Added `livenessProbe` to containers. This will ensure that containers
  are terminated (and restarted) when containers stop serving traffic
  for whatever reason.

## [1.5.6] - 2018-10-05

- Deployment has new label `idleable: "true"` to allow for future opt-in to new
  label-selector in the idler. This will allow idling of both rstudio (as
  currently avaiable) and jupyter or any other deployment we add this label to.

## [1.5.5] - 2018-08-15

- Added tls config to ingress.  This is required for tls termination with the nginx ingress controller. See [Trello](https://trello.com/c/M1snktNZ)

## [1.5.4] - 2018-07-09

- Modified RStudio image tag from v1.3.2 to 3.4.2-5 See: [PR](https://github.com/ministryofjustice/analytics-platform-rstudio/pull/34)

## [1.5.3] - 2018-06-05

- Adjusted memory resource limits and requests from `request: 1GB => 5GB` & `limit: 12GB => 20GB`

## [1.5.2] - 2018-05-10

Use `rstudio-auth-proxy` [`v1.4.3`](https://github.com/ministryofjustice/analytics-platform-rstudio-auth-proxy/releases/tag/v1.4.3.).
This version of the proxy updates some dependencies and fixes [CVE-2018-3728](https://nvd.nist.gov/vuln/detail/CVE-2018-3728).

## [1.5.1] - 2018-04-27

- Modified `values.yaml` to use v1.3.2 RStudio image.

## [1.5.0] - 2018-04-26

- Modified `values.yaml` to use latest RStudio image. [Trello](https://trello.com/c/RvX3onRE)

## [1.4.2] - 2018-04-10

- Cookie session lasts 8h instead of 1h (`COOKIE_MAXAGE` environment
variable).
  The reason is because RStudio is not making new HTTP requests and therefore
  not triggering the silent re-logging for users keeping RStudio open for
  more than 1h.

## [1.4.1] - 2018-02-28

- sets `COOKIE_MAXAGE` variable in auth proxy to expire session cookies after
  1 hour (can be configured via `authProxy.cookieMaxAge` value which by default
  is `3600` seconds)
- Bumped `rstudio-auth-proxy` docker image used to `v1.4.2`.
  This version expires session cookies (after 1 hour by default).

## [1.4.0] - 2018-02-22

- Bumped rstudio-auth-proxy docker image used to v1.4.1.
  This version enable silent SSO for RStudio
- Use newly added rstudio-auth-proxy's `GET /healthz` endpoint as
  readiness probe

## [1.3.3] - 2018-02-16

- Bumped rstudio-auth-proxy docker image used to v1.3.0.
  This is the version using Auth0 hosted login page

## [1.3.0] - 2018-02-14

- Pass `APP_PROTOCOL` and `APP_HOST` to rstudio-auth-proxy container.
  This is required in order to Auth0 hosted login page logout to work.
- Added `CHANGELOG.md`
