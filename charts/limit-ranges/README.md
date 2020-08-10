# Limit ranges

Creates `limit ranges` for a namespace [Limit Ranges](https://kubernetes.io/docs/concepts/policy/limit-range)

### Installing

```bash
helm upgrade limit-ranges mojanalytics/limit-ranges --install
```

### Configuration

| Parameter        | Description                     |
| ----------       | ---------------                 |
| `namespace`      | (__required__) The name of the namespace to apply the Limit Range to |
| `limits`         | (__required__) The CPU and Memory limits to apply to pods that don't have them defined |
| `requests`       | (__required__) The CPU and Memory requests to apply to pods that don't have them defined |


### Usage

Add `LimitRange` in the `apps-prod` namespace:

```yaml
limit_ranges:
  - namespace: apps-prod
    limits:
      cpu: 2
      memory: 2Gi
    requests:
      cpu: 100m
      memory: 100Mi
  - namespace: default
    limits:
      cpu: 1
      memory: 4Gi
    requests:
      cpu: 100m
      memory: 100Mi  
```
