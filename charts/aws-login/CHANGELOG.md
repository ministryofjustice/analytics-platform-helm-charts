# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [1.1.0]

- Adds image pull secrets so images can be pulled from Docker Hub with authentication

## [1.0.1]

## [1.0.0] - 2018-09-26

### Added

Added (optional) TLS block in ingress resource.
You can set the `ingress.addTlsBlock` value to `false` if your
ingress-controller doesn't work when ingress resources have this block (e.g.
[traefik](https://traefik.io) doesn't seem to work)

### Changed

`ingress.*` values structure changed so now you'll just pass a single
host in `ingress.host` instead of an array in `ingress.hosts`.

**NOTE**: You values files will need to change accordingly.
