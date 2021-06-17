# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [1.0.3] - 2021-06-17
## Changed
- Default EFS to alpha EFS so it will work before the chart invocation for CPanel is merged

## [1.0.2] - 2021-06-16
## Changed
- Update the number of PVCs allowed so we can have EFS + NFS at the same time

## [1.0.1] - 2021-06-10
## Changed
- Add an EFS mount point for all new users
- Rename the existing nfs mount point creation stuff from efs... (which it wasn't) to nfs.... (which is was)

## [1.0.0] - 2020-11-23
## Changed
- Use Ubuntu docker image in our ECR container registry (private) rather than
  the public DockerHub one. This is to reduce the number of pulls we make
  to DockerHub and reduce the pressure on our newly introduced small quota

**NOTE**: Techically this is a breaking change to this helm chart if it's
used by someone outside our team, hence the major version bump.
If this affects you (potential external user of this helm chart), just
override the `ubuntu.image` value and it should work for you.


## [0.1.6] - 2019-09-10
## User Read Rolebinding
- Add a `RoleBinding` in user namespaces for __user-read__ `ClusterRole` and team.


## [0.1.5] - 2019-08-19
## User Support role
- Allow members of the user-support github team to have admin access to user namespaces


## [0.1.4] - 2018-03-13
## Lock down namespace assume role
- Restrict a users namespace to only assuming the role from their own user


## [0.1.2] - 2018-03-13
## OIDC Username Claim
- Add idp prefix to username in Clusterrolebinding


## [0.1.1] - 2018-01-09
## Add Clusterrolebinding
- This assigns the admin user-facing role to a user, scoped to the user's namespace


## [0.1.0] - 2017-07-13
## Copy charts from ops
