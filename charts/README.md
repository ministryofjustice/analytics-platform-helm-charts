# Getting started with Helm

**[Helm](https://github.com/kubernetes/helm)** is a tool for managing Kubernetes charts. Charts are packages of pre-configured Kubernetes resources.

1. Install helm (see link for instructions)
2. Run `$ helm init --service-account helm`

# How to contribute?

1. Create a branch off master
2. Make the changes in the helm charts
3. Bump the version in Chart.yaml for each modified chart
4. [Test in dev](#how-to-test)
5. Push the changes

Commits to the master branch of this repository will trigger a [Concourse CI pipeline](https://github.com/ministryofjustice/analytics-platform-concourse-pipelines#update-helm-repoyaml) which updates the packaged Helm charts and index in our Helm repository:
http://moj-analytics-helm-repo.s3-website-eu-west-1.amazonaws.com/

# How to test?

1. Set the `kubectl` context to the dev cluster
2. Read the Chart's README or see below for specific installation instructions

# Chart info

Here is some top-level info on the charts. For full info, see the README.md in their respective directories.

Set $ENV to your environment name. In the URLs, replace `dev` with your environment name.

## init-platform

Creates k8s resources related to the users home directories.

```bash
$ helm install charts/init-platform -f ../analytics-platform-config/chart-env-config/$ENV/init-platform.yml --namespace default --name init-platform
```

## nginx-ingress

Necessary to access the services from outside the cluster.

```bash
$ helm upgrade cluster-ingress stable/nginx-ingress -f ../analytics-platform-config/chart-env-config/$ENV/nginx-ingress.yml --namespace default --install --version 0.28.2
```

## kube2iam

Responsible for attaching IAM roles to pods with the `iam.amazonaws.com/role`
annotation.


```bash
$ helm install stable/kube2iam -f ../analytics-platform-config/chart-env-config/$ENV/kube2iam.yml --namespace default --name kube2iam
```

## rbac

Responsible for authorizing users that authenticated with OIDC.


```bash
kubectl create ns airflow
kubectl create ns apps-prod
helm upgrade rbac-chart charts/rbac --install
```

## cpanel

Control panel app. See [cpanel README](charts/cpanel/README.md) for Auth0 set-up.

```bash
$ helm install charts/cpanel -f ../analytics-platform-config/chart-env-config/$ENV/cpanel.yml --name cpanel-master
```

## node-exporter

Exports metrics about the kubernetes nodes.

```bash
$ helm install charts/node-exporter --namespace kube-system --name node-metrics
```

## kube-dashboard

Kubernetes dashboard.

Available at http://dashboard.services.dev.mojanalytics.xyz

#### Read Only

At __login__ screen select __Skip__ to view dashboard in Read-Only mode.

#### Admin

At __login__ screen select idToken and paste the appropriate idToken from your `KUBECONFIG` file.

Alternatively

Get an idToken with the [Auth0-Kube-App](https://quay.io/repository/mojanalytics/auth0-golang-kube-app)

```bash
$ kubectl apply -f ../analytics-platform-config/chart-env-config/$ENV/kube-dashboard.yml
```

## fluentd

Reads the logs and sends them to ElasticSearch/Kibana.

```bash
$ helm install charts/fluentd -f ../analytics-platform-config/chart-env-config/$ENV/fluentd.yml --namespace kube-system --name cluster-logging
```


## kibana-auth-proxy

Grant (authorised) access to the Kibana to view the logs. Kibana is hosted with ElasticSearch in AWS.

Available at https://kibana.services.dev.mojanalytics.xyz/_plugin/kibana

```bash
$ helm install charts/kibana-auth-proxy -f ../analytics-platform-config/chart-env-config/$ENV/kibana.yml --namespace kube-system --name cluster-logviewer
```


## prometheus

Collects metrics, monitor systems and can send alerts.

```bash
$ helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/
$ helm install coreos/prometheus-operator --name prometheus-operator --namespace monitoring
$ helm install coreos/kube-prometheus --name kube-prometheus --namespace monitoring -f analytics-platform-config/chart-env-config/{env}/prometheus.yml
```
#### Note
`prometheus.yml` file can be found [here](https://github.com/ministryofjustice/analytics-platform-config/tree/master/chart-env-config)

## grafana

Analytics and monitoring interface.

Available at https://grafana.services.dev.mojanalytics.xyz

```bash
$ helm install stable/grafana -f ../analytics-platform-config/chart-env-config/$ENV/grafana.yml --namespace kube-system --name cluster-monitoring
```

## Concourse

CI/CD platform for automated jobs, builds and deployments

[Chart](https://github.com/kubernetes/charts/tree/master/stable/concourse)

Available at https://concourse.services.alpha.mojanalytics.xyz

```bash
$ helm upgrade --install --recreate-pods --namespace default concourse stable/concourse --values analytics-platform-config/chart-env-config/alpha/concourse.yaml
```
