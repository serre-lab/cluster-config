# p\* Cluster Configuration

This repository contains Kubernetes configuration files for the cluster running
on p1-5.

## Major Components

* `auth/` - [RBAC](https://kubernetes.io/docs/admin/authorization/rbac) definitions
   for cluster administrators and general access for users.
* `registry/` [WIP] - a Docker registry hosted on the cluster (unresolved issues
  include certificate management and storage, since Docker images are pretty big).
* `dex/` [Unused] - configuration for a [dex](https://github.com/coreos/dex)
  authentication server, which would be based on either Slack or Brown SSO.
* `nvidia/` - Unused FlexVolume installer for NVIDIA drivers and example GPU
  pod using the well-known host directory containing Kubernetes-friendly GPU
  drivers.


