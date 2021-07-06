# Analytics Platform - Charts (Kubernetes packages)

This repository contains source YAML for Helm Charts, which define the Kubernetes software packages, that make up the Analytical Platform (AP). After the [AP infrastructure is set-up](https://github.com/ministryofjustice/analytics-platform-ops/blob/master/README.md) you can install the AP software using these charts.

## Charts installation/upgrade with Concourse and S3 based Helm Repo

The latest master versions of these charts are kept up-to-date in the MOJ AP Helm repository:
http://moj-analytics-helm-repo.s3-website-eu-west-1.amazonaws.com/ - this helm repository is automatically [updated by this Concourse pipeline](https://concourse.services.alpha.mojanalytics.xyz/teams/admin/pipelines/update-helm-repo) ([pipeline code](https://github.com/ministryofjustice/analytics-platform-concourse-pipelines#update-helm-repoyaml))

You can install/upgrade these charts from the Helm repository by adding the repo to your helm client, eg:

```sh
helm repo add mojanalytics http://moj-analytics-helm-repo.s3-website-eu-west-1.amazonaws.com/
helm repo update
# and then
helm upgrade --install $release_name mojanalytics/$chart_name -f ...
```

OR for development you can clone this repo and specify the path to your local copy of the chart:

```sh
helm upgrade --install $release_name charts/$chart_name -f ...
```

**Pro tip**: You can preview the installation/upgrade changes by passing the `--dry-run --debug` flags to the `helm` command and remove them once you're happy with the output.

## Charts installation with Github actions and gh-pages Helm Repo

The Github Actions Workflow uses [helm chart-releaser](https://helm.sh/docs/howto/chart_releaser_action/) action to automate releasing charts through GitHub pages. A GitHub branch called gh-pages is used to store the published charts. 

When you now push a change to your master branch, the action checks each chart for a new version. For updated charts it creates a GitHub Release and adds the chart artifact *.tgz file to the release. Now the index.yaml file on the gh-pages branch is updated to add your new chart version with the link to the GitHub Releases artifact.

Charts can be deployed be specifying the helm chart
``` 
url: https://ministryofjustice.github.io/analytics-platform-helm-charts
```

also see [Helm Chart Releaser](https://github.com/marketplace/actions/helm-chart-releaser)

## A minimal set-up

To run a minimal version of AP, these are the essential charts to deploy:

* `init-platform`
* `nginx-ingress` (with release name `cluster-ingress`)
* `kube2iam` (official `stable/kube2iam` helm chart)
* `rbac`
* `cpanel`
* `aws-login`

## Full set-up

All of the above plus:

* [airflow](./charts/airflow-k8s)
* `cert-manager` (official `charts.jetstack.io/cert-manager` helm chart)
* [cert-manager-resources](./charts/cert-manager-resources)
* [cluster-autoscaler](./charts/cluster-autoscaler)
* `cluster-logging` (official `stable/fluentd` chart)
* [cluster-log-viewer](./charts/kibana-auth-proxy)
* `concourse` (official `stable/concourse`)
* [concourse-admin-team](./charts/concourse-admin-team)
* [idler](./charts/idler)
* [images-prepuller](./charts/images-prepuller)
* [kubernetes-dashboard](./charts/kubernetes-dashboard)
* `kuberos` (official `stable/kuberos`)
* [logstash-auth0](./charts/logstash)
* `metrics-server` (official `stable/metrics-server`)
* [network-policies](./charts/network-policies)
* [nfs-backup](./charts/nfs-backup)
* [org-pipeline-moj-analytical-services](./charts/concourse-org-pipeline)
* [pod-cleaner](./charts/pod-cleaner)
* [priority-classes](./charts/priority-classes)
* `prometheus-operator` (official `stable/prometheus-operator`)
* [promethues-resources](./charts/prometheus-resources)
* [restarter](./charts/restarter)
* [unidler](./charts/unidler)
* [webhook-dispatcher](./charts/webhook-dispatcher)
* [websocket-status](./charts/websocket-status)
