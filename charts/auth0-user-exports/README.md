# Auth0 User Exports

##### CronJob that runs [auth0-user-exports](https://github.com/ministryofjustice/analytical-platform-auth0-user-exports)

### Install/Upgrade

```bash
helm upgrade auth0-user-exports mojanalytics/auth0-user-exports --namespace default --values ../analytics-platform-config/chart-env-config/$ENV/auth0-user-exports --install
```

### Remove

```bash
helm del --purge auth0-user-exports
```

### Configuration

| Parameter  | Description      | Default |
| ---------- | ---------------  | ------- |
| `schedule` | When the job should execute (In **Cron** format) | *Monday to Friday at 23:00* |
| `env.auth0_domain` | Auth0 management API endpoint | https://alpha-analytics-moj.eu.auth0.com |
| `env.auth0_client_id` | The Client ID of the auth0 application used for this app | "" |
| `env.auth0_client_secret` | The Client Secret of the auth0 application used for this app | "" |
| `env.env` | **OPTIONAL** Environment in which the app is running. Set to `aws` to write to s3 | `aws` |
| `env.role_arn` | The `IAM` role to assume when writing to `s3` | `arn:aws:iam:::role/auth0-user-data-write` |
| `env.bucket` | The `S3` bucket to write to when `ENV=aws` is set. | `auth0-userdata` | 
