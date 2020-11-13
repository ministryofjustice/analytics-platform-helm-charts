# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2020-11-13

- Adds image pull secrets so images can be pulled from Docker Hub with authentication

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

# OIDC Username Claim

- Add idp prefix to username in Clusterrolebinding

## [0.1.1] - 2018-01-09

## Add Clusterrolebinding

- This assigns the admin user-facing role to a user, scoped to the user's namespace

## [0.1.0] - 2017-07-13

## Copy charts from ops
