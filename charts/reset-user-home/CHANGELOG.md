# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [0.4.2] - 2020-09-15
### Changed
Improved conda reset by moving not only the `~/.conda/envs/rstudio` environment
but the whole `~/.conda/` directory AND the `~/.condarc` config file.

This is to address RStudio startup problems caused by other conda environments
and/or broken conda configuration on JupyterLab (or whatever).


## [0.4.1] - ???
### Added
Initial release?
