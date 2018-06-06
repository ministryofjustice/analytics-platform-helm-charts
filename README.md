# Analytics Platform Kubernetes packages

This repository contains the source YAML for our Helm charts.

Commits to the master branch of this repository will trigger a Concourse CI pipeline which updates the packaged Helm charts and index in our Helm repository:
http://moj-analytics-helm-repo.s3-website-eu-west-1.amazonaws.com/

You can install these charts by adding the repo to your helm client, eg:

```sh
helm repo add mojanalytics http://moj-analytics-helm-repo.s3-website-eu-west-1.amazonaws.com/
helm repo update
# and then
helm install mojanalytics/$chart_name
```
