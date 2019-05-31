# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.1.5] - 2019-05-31 
## Change NFS Home Backend to NetApp Trident 
- Modified `PersistentVolumeClaim` to provision NFS home on NetApp ONTAP via [Trident](https://github.com/NetApp/trident)
- Modified `ResourceQuota` to allow up to two `PersistentVolumeClaim`'s in a user's namespace
- Modified `ResourceQuota` to allow an aggregate of `20GB` in a user's namespace
- Removed un-required `PersistentVolume` resource 

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
