# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


## [v4.0.5] - 2020-08-13
### Changed
- Paths to static CSS and crown jewels.


## [v4.0.4] - 2019-11-05
### Removed
Removed `Ingress` resource. This is not needed as the unidler is only
accessed from within the cluster when a user tool is idled and its
`Service`'s `ExternalName` points to `unidler.default.svc.cluster.local`
(internally resolved).

**NOTE**: This also means we can remove few values as they're not used
anymore: `ingress.*` and `servicesDomain` value is no more needed.

**NOTE**: This shouldn't break anything.


## [v4.0.3] - 2019-11-04
### Changed
- uses [unidler v1.0.4](https://github.com/ministryofjustice/analytics-platform-go-unidler/releases/tag/v1.0.4)
- this version calculate "unidle key" slightly differently
  to avoid problems with new long domain: it only uses
  the part of the host before the first dot (".") when
  the host is longer than 63 character
- its behaviour doesn't change for old clusters/domain
  as hosts are shorter then 63 chars (to not break
  compatibility)
- it also has `UNIDLE_KEY_LABEL` (defaults to `host`)
  which can be used in new clusters to look for resources
  by using the `unidle-key` label (instead of the old
  `host` label which we'll remove once `alpha` cluster
  is retired)

- [unidler PR](https://github.com/ministryofjustice/analytics-platform-go-unidler/pull/14)
- Part of ticket: https://trello.com/c/kVT0QFqe


## [v4.0.2] - 2019-10-29
### Changed
Works with `host` labels truncated at 63 chars (k8s limit).

This is to be sure the unidler searches for the same label value when
unidling things in the new clusters (whose hosts are very long).

**NOTE** It shouldn't make any difference on existing clusters as these
labels don't exceed this limit. On new clusters should work as before.

- [unidler PR](https://github.com/ministryofjustice/analytics-platform-go-unidler/pull/12)
- Part of ticket: https://trello.com/c/kVT0QFqe


## [v4.0.1] - 2019-03-27
### Fixed
Use new version of the unidler which uses strategic merge patch instead of
JSONPatch.

Strategic merge is more declarative and more robust. When deleting
a key which is not there it would consider that part of the patch as already
applied instead of raising an error as in the case of JSONpatch.

- [unidler PR](https://github.com/ministryofjustice/analytics-platform-go-unidler/pull/10)
- Part of ticket: https://trello.com/c/vr4LPcde/241-investigate-fix-idling-unidling-problems-caused-by-k8s-cluster-upgrade-new-version-of-k8s


## [v4.0.0] - 2019-03-27
### Changed
Bumped unidler to version `v1.0.0`.

**NOTE**: This is a breaking change as the unidler now uses the `host` labels
to retrieve the resources to change. But these labels need to be there.
So not exactly retro-compatible.

- use `host` labels to find Ingress, Deployment, etc...
- use `mojanalytics.xyz/replicas-when-unidled` annotation instead of old
  `mojanalytics.xyz/idled-at` which was trying to do too many things at once

SEE:
- [unidler changes](https://github.com/ministryofjustice/analytics-platform-go-unidler/pull/9)
- [migration to add labels](https://github.com/ministryofjustice/analytics-platform-ops/pull/266)


## [v3.2.2] - 2019-03-21
### Changed
Bumped unidler to version `v0.2.3`.

**Less errors reaching the user and UX tweaks**

- Removed #/6 "progress" messages as confusing (for some users)
- Better handling of "nonexistent key" error when patching Service to avoid
  showing "Failed to redirect back your app" when we can safely recover.
- when unidling an app which has annotation with unidled number of replicas
  of `0`, assume this is a mistake and set number of replicas to `1`.


## [v3.2.1] - 2019-03-14
### Changed
Bumped unidler to version `v0.2.1`.

**Better handling of connection errors and wording tweaks**

- treat connection errors differently: e.g. don't show undefined message and
  don't close EventSource to allow recover
- tell the user that wait for the deployment could take minutes
- don't send low-level k8s error to user when Service.Patch() failed
- improved logging messages to be more accurate of what actually happened


## [v3.2.0] - 2019-03-13
### Changed
New version of unidler which should fix [Issue #95]:

"Unidler giving misleading messages", specifically it sometimes shows a
strange `undefined` JS error. We think this was caused by the unidler
erroneously updating the app Service too early. If then the client
for whatever reason makes another request to `/events` this will go to
the actual app which doesn't have a `/events` endpoint.

Other improvements:
- users receive more updates as their app is being unidled
- fixed space between text and image
- unidler logs more useful things now
- other internal refactorings which shouldn't be user-facing
- Don't set `INGRESS_CLASS_NAME` variable as unidler doesn't use it anymore

[Issue #95](https://github.com/ministryofjustice/analytics-platform/issues/95)


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
