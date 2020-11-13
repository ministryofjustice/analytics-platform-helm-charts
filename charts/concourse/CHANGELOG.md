# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [1.10.0] - 2020-11-13

- Adds image pull secrets so images can be pulled from Docker Hub with authentication

## [1.9.1] - 2020-07-13

- Add `priorityClassName` to the concourse worker statefulset so can set a priority class for worker pods.
- Ensure all loop devices are deleted before starting up a concourse worker.

## [1.9.0] - 2020-07-13

Added concourse chart as a copy of the stable/concourse chart as we need to make some small changes to it to improve the stability of the concourse workers.
