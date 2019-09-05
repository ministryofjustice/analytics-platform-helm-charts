# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.2.6] - 2019-09-09
### FluentD Tuning
- Implemented new sources files for security purposes: `/var/log/auth.log` and `/var/log/syslog`

## [0.2.5] - 2019-09-02
### FluentD Selector in Daemonset Spec
- Add `selector` to `spec` in daemonset as required by `apps/v1` api

## [0.2.4] - 2019-03-19
### FluentD Pod Priority Class
- Changed `priorityclassname` key to `priorityClassName`

## [0.2.3] - 2019-03-18
### FluentD Pod Priority Class
- Added `priorityClassName` reference to system `PriorityClass`. [Trello](https://trello.com/c/Ay2ryNvC)
- Increased burstable cpu limit from `500m` to 1 cpu
- Changed apiVersion for `daemonset`

## [0.2.2] - 2019-03-08
### FluentD Resources
- Increased cpu shares for fluentd

## [0.2.1] - 2019-03-04
## Schedule to High memory nodes
- Added toleration for highmem node's taint
- Added `operator` context to k8s master toleration

## [0.2.0] - 2018-04-25
### FluentD Tuning
- Modifying to currently working config set.
  Particularly ensuring we are capturing systemd events from journalD as our current distro is
  debian jessie

- Removing log sources that do not exist on systemd distros i.e.
  `/var/log/kubelet`.  Mentioned path will only exists on sysV init
  distros.

- Moving to supported K8s addon release of fluentD-elasticsearch

- Increasing slow_flush_log_threshold to prevent the corresponding
  threshold exceeded exception

- Increasing buffer chunk and queue limits helps remedy flush failures while
  elasticsearch falls behind during ingestion

- Ensuring this pod can tolerate no-schedule taints on master nodes
