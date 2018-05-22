# Analytical Platform Control Panel API Concourse Pipeline Helm Chart

Installing this chart will set a pipeline in a specified Concourse installation,
which monitors the Control Panel API repo for releases and deploys them.


## Installing the Chart

To install the chart:

```bash
helm install mojanalytics/cpanelapi-pipeline \
  --name cpanelapi-pipeline \
  --values /path/to/chart/configs/cpanelapi-pipeline.yaml
```

## Configuration

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| concourse.externalURL | Concourse URL (not the in-cluster address) | "" |
| concourse.password | Basic authentication password for Concourse | "" |
| concourse.team | Concourse team name | `main` |
| concourse.username | Basic authentication username for Concourse | "" |
| env | The name of the environment to deploy to (eg: dev, alpha) | `dev` |
| gitcryptSymmetricKey | The key used to unlock the gitcrypt encrypted config
repo | "" |
| github.accessToken | Github personal access token for API | "" |
| github.webhookToken | Access token for Github webhook calling Concourse
resource | "" |
| kubernetes.apiUrl | Kubernetes cluster API URL | "" |
| kubernetes.caCert | Kubernetes cluster CA certificate for API access | "" |
| kubernetes.token | Kubernetes token for API access | "" |
| quay.password | Quay.io token for API access | "" |
| quay.username | Quay.io username for API access | "" |
