#!/bin/sh

curl -o /usr/local/bin/fly "$CONCOURSE_URL/api/v1/cli?arch=amd64&platform=linux"

chmod +x /usr/local/bin/fly

fly -t default login \
    -c $CONCOURSE_URL \
    -u $FLY_USERNAME \
    -p $FLY_PASSWORD \
    -n $CONCOURSE_TEAM

fly -t default set-pipeline \
    -n $CONCOURSE_TEAM \
    -p $1 \
    -c /scripts/pipeline.yaml \
    -v env=$ENV \
    -v team_name=$CONCOURSE_TEAM \
    -v concourse_url=$CONCOURSE_URL \
    -v github-webhook-token=$GITHUB_WEBHOOK_TOKEN
