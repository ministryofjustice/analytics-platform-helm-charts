# Analytical Platform Concourse admin team

Installing this chart will create an admin team in a specified Concourse
installation, setting up secrets shared by the pipelines used to deploy platform
components.


## Installing the Chart

To install the chart:
```bash
helm install mojanalytics/concourse-admin-team \
  --name concourse-admin-team \
  --values /path/to/chart/configs/concourse-admin-team.yaml
```


## Configuration

| Parameter  | Description  | Default  |
| ---------- | ------------ | -------- |
| concourse.url | Concourse URL (not the in-cluster address) | "" |
| concourse.password | Basic authentication password for Concourse | "" |
| concourse.username | Basic authentication username for Concourse | "" |
| gitcryptKeys.config | The key used to unlock the gitcrypt encrypted config repo | "" |
| github.accessToken | Personal access token for the Github API | "" |
| kubernetes.apiUrl | Kubernetes cluster API URL | "" |
| kubernetes.caCert | Kubernetes cluster CA certificate for API access | "" |
| kubernetes.token | Kubernetes token for API access | "" |
| quay.password | Password / token for quay.io | "" |
| quay.username | Username for quay.io | "" |
