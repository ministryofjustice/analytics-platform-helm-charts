# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2020-11-13

- Adds image pull secrets so images can be pulled from Docker Hub with authentication

## [1.0.0] - 2018-09-27

Added (optional) TLS block in ingress resource.
You can set the `ingress.addTlsBlock` value to `false` if your
ingress-controller doesn't work when ingress resources have this block (e.g. [traefik](https://traefik.io) doesn't seem to work)

## [0.1.1] - 2018-07-09

- Bumping image tag to 6.3.1 (from 5.6.10) to match elasticsearch version

## [0.1.0] - 2018-06-26

- Initial chart development
