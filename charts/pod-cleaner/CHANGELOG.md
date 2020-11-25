# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [1.0.0] - 2020-11-23
### Changed
Pull `kubectl` image from our private AWS ECR registry.
This is technical a breaking change - in case anyone outside our team uses
this helm chart (unlikely) - and that's why the major version number bump.
This image value can be overridden if necessary to point to the same image
in a public container registry.


## [0.1.1] - 2019-07-02
### Fixed
Fixed Docker permission error while executing `pod_cleaner.sh` script.
Possibly caused by some change in Kubernetes.


## [0.1.0] - 2019-05-03
### Added
Also delete pods in `Pending` phase.


## [0.0.1] - 2019-04-30
### Added
Initial release, yay!
