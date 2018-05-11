# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [0.1.4] - 2018-05-11
### Added
Added `secrets.cpanel-api-url` secret, intended to be overridden in config repo.
This contains the base URL of the Control Panel API.

### Changed
Bumped the version of the Concourse Github Org resource to 0.3.9
Reduced org polling interval to once every 24 hours - checks are intended to be
triggered via Github webhook instead.


## [0.1.3] - 2018-04-26
### Added
Added IP range secrets for DOM1, QUANTUM and 102PF for use in webapp
deployment IP restriction parameters.

### Changed
Modified webapp deployment pipeline to include new task to read deployment
parameters from a `deploy.json` file in the webapp repo and pass those values to
the webapp helm chart.
