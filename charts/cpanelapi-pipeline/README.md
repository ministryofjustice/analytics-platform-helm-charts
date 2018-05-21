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
| appDomain | Base domain for deployed API | "" |
| auth0.authzAudience | Auth0 Authorization API audience | "" |
| auth0.authzUrl | Auth0 Authorization API URL | "" |
| auth0.clientId | Auth0 client ID for API access | "" |
| auth0.clientSecret | Auth0 client secret for API access | "" |
| auth0.domain | Auth0 tenant domain | "" |
| concourse.externalURL | The same value as for the Concourse Helm chart | "" |
| concourse.password | Basic authentication password for Concourse | "" |
| concourse.team | Concourse team name | `main` |
| concourse.username | Basic authentication username for Concourse | "" |
| env | The name of the environment to deploy to (eg: dev, alpha) | `dev` |
| github.accessToken | Github personal access token for API | "" |
| github.webhookToken | Access token for Github webhook calling Concourse
resource | "" |
| kubernetes.apiUrl | Kubernetes cluster API URL | "" |
| kubernetes.caCert | Kubernetes cluster CA certificate for API access | "" |
| kubernetes.token | Kubernetes token for API access | "" |
| quay.password | Quay.io token for API access | "" |
| quay.username | Quay.io username for API access | "" |
