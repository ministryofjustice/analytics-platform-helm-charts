# Provision User Chart


## Installing the Chart

This chart is run following the bootstrap-user chart. It runs in a user's namespace and creates:

A PV pointing at the global shared home EFS mount point
A PVC pointing at the new PV

Note that PVs are *not* namespaced, but PVCs are.