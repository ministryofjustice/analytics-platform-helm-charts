# Concourse Org Pipeline Helm Chart

Installing this chart will set a pipeline in a specified Concourse installation,
which monitors a specified Github Organization for pushes and creates deployment
pipelines for repositories which contain Analytical Platform webapps.


## Installing the Chart

To install the chart:

```bash
helm install mojanalytics/concourse-org-pipeline \
  --name org-pipeline-$ORG_NAME \
  --values /path/to/chart/configs/concourse-org-pipeline.yaml
```

## Configuration

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| appDomain | Base domain for deployed webapps | "" |
| auth0.authzAudience | Auth0 Authorization API audience | "" |
| auth0.authzUrl | Auth0 Authorization API URL | "" |
| auth0.clientId | Auth0 client ID for API access | "" |
| auth0.clientSecret | Auth0 client secret for API access | "" |
| auth0.domain | Auth0 tenant domain | "" |
| aws.ecrAccessKeyId | AWS Access Key ID for read/write to ECR | "" |
| aws.ecrSecretAccessKey | AWS Secret Access Key for read/write to ECR | "" |
| aws.region | Default AWS region | "eu-west-1" |
| concourse.externalURL | The same value as for the Concourse Helm chart | "" |
| concourse.password | Basic authentication password for Concourse | "" |
| concourse.team | Concourse team name | `main` |
| concourse.username | Basic authentication username for Concourse | "" |
| cookieSecret | Secret used to encrypt webapp auth cookies | "" |
| github.org | Github Organization name | `moj-analytical-services` |
| github.accessToken | Github personal access token for API | "" |
| github.webhookToken | Access token for Github webhook calling Concourse
resource | "" |
| githubOrgResource.image | [Github Org Resource](https://github.com/ministryofjustice/analytics-platform-concourse-github-org-resource) docker image | `quay.io/mojanalytics/github-org-resource` |
| githubOrgResource.tag | `v0.3.4` |
| ipRanges.wifi102pf | CIDR IP range for 102PF | "" |
| ipRanges.dom1 | CIDR IP range for DOM1 | "" |
| ipRanges.quantum | CIDR IP range for QUANTUM | "" |
| kubernetes.apiUrl | Kubernetes cluster API URL | "" |
| kubernetes.caCert | Kubernetes cluster CA certificate for API access | "" |
| kubernetes.token | Kubernetes token for API access | "" |
