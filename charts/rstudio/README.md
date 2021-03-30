# RStudio Helm Chart

## Install/upgrade the Chart

To install/upgrade an rstudio instance for the user specified in the username variable (Github username):

```bash
helm upgrade --dry-run --debug --install USERNAME-rstudio --namespace user-USERNAME --set username=USERNAME --set aws.iamRole=ENV_user_USERNAME charts/rstudio -f chart-env-config/ENV/rstudio.yml
```

The instance will be available at <https://USERNAME-rstudio.tools.ENV.mojanalytics.xyz>.

### Notes

Change the environment config file to deploy in a different environment (the URL will change accordingly)

Remove the `--dry-run` option to install/upgrade for real.

If you want a particular version, add parameter: ``--version CHART_VERSION`` e.g. ``--version 2.2.5``.

NB helm is [not good at doing upgrades](https://github.com/ministryofjustice/analytics-platform/wiki/R-Studio-start-up-failure#fix-with-helm) - if you run into trouble, it's usually easiest to delete+purge the chart and install again:

```bash
helm delete --purge rstudio-USERNAME
```

## Configuration

### Auth0 application

In Auth0 you need to create an Application:

1. Login to https://manage.auth0.com/ and select the tenant for your environment
2. In the side-bar click "Applications"
3. Click "Create Application"
      * Name: RStudio
      * Application Type: Regular Web Applications
4. Click "Save"
5. Click "Connections" tab
6. Switch OFF "Database" and "Google"
7. Click "Settings"
      * Allowed Callback URLs: `http://localhost:3000/callback, https://*-rstudio.tools.$env.$domain/callback`
      (replace the $variables)
      * Allowed Logout URLs: `https://*-rstudio.tools.$env.$domain` (replace the $variables)
      * Allowed Origins (CORS): `https://*-rstudio.tools.$env.$domain` (replace the $variables)
8. Click "Save changes"

Record the Client ID and Client Secret values - you'll use them in the configuration below.

### rstudio.yml

Listing only the required params here. See `/chart-env-config/` for more
details.

| Parameter                  | Description                                               | Default |
| -------------------------- | --------------------------------------------------------- | ------- |
| `proxy.auth0.clientId`     | Auth0 'RStudio' application's client ID                   | `""`    |
| `proxy.auth0.clientSecret` | Auth0 'RStudio' application's client secret               | `""`    |
| `proxy.auth0.domain`       | Auth0 tenant domain e.g. `dev-analytics-moj.eu.auth0.com` | `""`    |
