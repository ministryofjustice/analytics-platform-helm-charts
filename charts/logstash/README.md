# Logstash

Deploys [logstash](https://www.elastic.co/products/logstash)

### Installing and Upgrading a release

``` bash
helm upgrade logstash-auth0 charts/logstash -f chart-env-config/ENV/logstash.yaml --namespace=default --install
```
