# buckets-archiver

CronJob which archives S3 buckets tagged with `to-archive=true` tag.

The data in the S3 bucket to archive is moved to `${archiveBucket}/${BUCKET_NAME}/`
before the S3 bucket is actually deleted.

The CronJob's schedule is determined by the `schedule` value (see below).

See: <https://github.com/ministryofjustice/analytics-platform-buckets-archiver>

## Installing/upgrading the Chart

```bash
helm upgrade --dry-run --debug --install buckets-archiver charts/buckets-archiver --namespace default  -f chart-env-config/ENV/buckets-archiver.yml
```

**NOTE**: Remove `--dry-run` to actually install/upgrade once you're
happy with the output.

## Configuration

| Parameter       | Description                                                                                 | Default                    |
| --------------- | ------------------------------------------------------------------------------------------- | -------------------------- |
| `env`           | environment to restrict archiving to (e.g. `dev`)                                           | `""`                       |
| `archiveBucket` | S3 bucket where the archived data will go (e.g. `dev-archived-buckets-data`)                | `""`                       |
| `iamRole`       | IAM role assumed by the buckets-archiver. See [buckets-archiver's permissions] for details. | `""`                       |
| `schedule`      | Cron format string defining time and frequency of runs                                      | `"*/5 * * * *"` (every 5m) |

[buckets-archiver's permissions]: https://github.com/ministryofjustice/analytics-platform-buckets-archiver#permissions
