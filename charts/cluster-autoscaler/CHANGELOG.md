# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2020-11-13

- Adds image pull secrets so images can be pulled from Docker Hub with authentication

## [0.1.5] - 2019-10-21

- Upgraded cluster autoscaler to lockstep with k8s version in new environment from `1.12.8` to `1.13.8`

## [0.1.4] - 2019-10-21

- Updated clusterrole api-group for replicasets
- Upgraded cluster autoscaler to lockstep with k8s version in __OLD__ environment from `1.3.5` to `1.12.8`

## [0.1.3] - 2019-03-13

- Increased CPU requests and limits from 100m to 200m and 500m respectively

## [0.1.2] - 2018-11-20

### Added

- Modified image tag from `v1.2.2` to `v1.3.5` after cluster upgrade. See [version table](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler#releases)

## [0.1.1] - 2018-11-20

- Added `Rolebinding` that allows __cluster-autoscaler__ to read the `configmap: cluster-autoscaler-status` in `namespace: default`
- Added `--namespace=default` flag as __cluster-autoscaler__ assumes that it's deployed to `namespace: kube-system`
