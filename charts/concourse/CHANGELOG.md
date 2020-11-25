# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [1.10.0] - 2020-11-13

- Adds support for k8s `imagePullSecrets` so images can be pulled from DockerHub
  with authentication.

**NOTE**: This is added in both the main chart and the sub-chart (postgresql)
via the `imagePullSecrets`/`postgresql.imagePullSecrets` values **NOT** the
`image.pullSecrets` value as in other our our helm charts.
This is because this chart and the `posgresql` one already have an `image`
value but it's not a dictionary (so we can't add to it without breaking
the chart and/or backward compatibility).
Also note that this value will have to be both set in `imagePullSecrets` AND
in `postgresql.imagePullSecrets` for this to be used by both charts.


## [1.9.1] - 2020-07-13

- Add `priorityClassName` to the concourse worker statefulset so can set a priority class for worker pods.
- Ensure all loop devices are deleted before starting up a concourse worker.


## [1.9.0] - 2020-07-13

Added concourse chart as a copy of the stable/concourse chart as we need to make some small changes to it to improve the stability of the concourse workers.
