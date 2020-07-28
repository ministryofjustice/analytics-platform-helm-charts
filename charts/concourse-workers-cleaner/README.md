# Concourse Workers Cleaner Chart


## Installing the Chart

This will install a CronJob object to periodically prune concourse workers that have stalled.

To install:

```bash
$ helm upgrade concourse-workers-cleaner mojanalytics/concourse-workers-cleaner -f chart-env-config/ENV/concourse-workers-cleaner.yaml --install --namespace default
```

The job's status can be viewed with `kubectl get cronjobs`

## Configuration

Listing only the required params here.

| Parameter             | Description                   | Default |
| --------------------- | ----------------------------- | ------- |
| `concourse.adminUsername`   | Concourse Admin user      | ``    |
| `concourse.adminPassword`   | Concourse Admin password  | ``    |
| `concourse.target`          | Concourse target          | ``    |
| `concourse.team`            | Concourse team            | ``    |
| `concourse.url`             | Concourse URL             | ``    |
