# Analytics Platform Kubernetes packages

This repository contains the source YAML for our Helm charts.

It also contains the packaged Helm charts via our Helm repository, hosted on
the Github pages for this repo:
http://moj-analytics-helm-repo.s3-website-eu-west-1.amazonaws.com

The chart packages and the Helm repo index are automatically updated on
commits to the master branch.

You can install these charts by adding the repo to your helm client, eg:

```sh
helm repo add mojanalytics http://moj-analytics-helm-repo.s3-website-eu-west-1.amazonaws.com
helm repo update
# and then
helm install mojanalytics/$chart_name
```
